.PHONY: get-argocd-password
get-argocd-password:
	@kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo