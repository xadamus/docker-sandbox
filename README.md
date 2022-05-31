## Setting up
### Secret for PGPASSWORD
`kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password`

### Ingress Nginx install
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml`
