.PHONY: get-argocd-password
get-argocd-password:
	@kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" -n argocd | base64 -d; echo

.PHONY: install-ingress-nginx
install-ingress-nginx:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

.PHONY: install-argocd-addon
install-argocd-addon:
	kubectl create ns argocd
	helm install argocd addons/argo-cd
	sleep 3
	kubectl apply -f addons/argo-cd/kind-fleet-project.yaml

.PHONY: install-bootstrap
install-bootstrap:
	helm install bootstrap bootstrap