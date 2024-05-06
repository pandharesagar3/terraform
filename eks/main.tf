module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "my-cluster"
  cluster_version = "1.21"

  subnets = [
    aws_subnet.public.id
  ]

  vpc_id = aws_vpc.main.id

  worker_groups = {
    eks_workers = {
      instance_type = "t3.medium"
      desired_capacity = 2
      max_capacity = 3
      min_capacity = 1
    }
  }

  manage_aws_auth = true
}
