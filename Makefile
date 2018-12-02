php_pod = $$(kubectl get pod --selector=app=php -o jsonpath='{.items[*].metadata.name}')

db_init:
	@kubectl exec -it $(php_pod) ./bin/console doctrine:database:create || true
	@kubectl exec -it $(php_pod) ./bin/console doctrine:migrations:migrate
