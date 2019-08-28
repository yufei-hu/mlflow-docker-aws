.PHONY: jupyter up down logs mlflow clean
.DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

jupyter: ## access the jupyter notebook
	open http://localhost:8888

up: ## docker-compose up
	docker-compose up -d

down: ## docker-compose down
	docker-compose down

logs: ## docker-compose logs
	docker-compose logs -f

mlflow: ## access the mlflow webpage
	open http://localhost:5000

clean: ## remove all working files and data
	@rm -rf jupyter/work/*
	@rm -rf postgres/data/*
