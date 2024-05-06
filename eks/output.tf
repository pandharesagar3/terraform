output "kubeconfig" {
  value = module.eks_cluster.kubeconfig
}

output "cluster_id" {
  value = module.eks_cluster.cluster_id
}
