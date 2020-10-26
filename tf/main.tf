resource "aws_ecr_repository" "devops-test-ecr-repo" {
  name = "devops-test-ecr-repo" 
}

resource "aws_ecs_cluster" "devops-test-cluster" {
  name = "devops-test-cluster" 
}