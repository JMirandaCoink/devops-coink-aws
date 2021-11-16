data "aws_eks_cluster" "eks" {
  name = module.coink-eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.coink-eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "coink-eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_version = "1.21"
  cluster_name    = "${var.project_name}-${var.environment}-eks"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets 

  node_groups = [
    {
      name             = "nodes1"
      iam_role_arn     = aws_iam_role.nodes.arn
      max_capacity     = 5
      min_capacity     = 1
      desired_capacity = 1
      instance_type    = "t2.micro"
    }
  ]
}