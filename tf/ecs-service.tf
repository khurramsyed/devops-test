resource "aws_ecs_service" "devops_service" {
  name            = "devops_service"                            
  cluster         = aws_ecs_cluster.devops-test-cluster.id             
  task_definition = aws_ecs_task_definition.deveops-test-task.arn 
  launch_type     = "FARGATE"
  desired_count   = 3 # Setting the number of containers we want deployed to 3

  network_configuration {
    subnets          = [aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id, aws_default_subnet.default_subnet_c.id]
    assign_public_ip = true # Providing our containers with public IPs
  }

}

# Providing a reference to our default VPC
resource "aws_default_vpc" "default_vpc" {
}

# Providing a reference to our default subnets
resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = "eu-west-2a"
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = "eu-west-2b"
}

resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = "eu-west-2c"
}