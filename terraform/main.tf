# Define the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "medusa_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.medusa_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.medusa_vpc.id
}

# Create a route table and associate it with the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.medusa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ECS Cluster
resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

# ECS Task Definition for Medusa Backend
resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "medusa-container"
      image     = "medusajs/medusa:latest"
      essential = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets = [aws_subnet.public_subnet.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }
}

# Security Group for ECS
resource "aws_security_group" "ecs_sg" {
  vpc_id = aws_vpc.medusa_vpc.id

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALB (Application Load Balancer)
resource "aws_lb" "medusa_lb" {
  name               = "medusa-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet.id]
  security_groups    = [aws_security_group.ecs_sg.id]
}

resource "aws_lb_target_group" "medusa_tg" {
  name     = "medusa-tg"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = aws_vpc.medusa_vpc.id
}

resource "aws_lb_listener" "medusa_listener" {
  load_balancer_arn = aws_lb.medusa_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa_tg.arn
  }
}
