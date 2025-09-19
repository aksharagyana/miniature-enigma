az aks show -g <rg> -n <aks-cluster> \
  --query "identity" -o json
