help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install pre-commit hooks
	@pre-commit install
	@pre-commit gc

uninstall: ## Uninstall hooks
	@pre-commit uninstall

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

clean: ## Clean
	$(info Make: running docker prune...)
	@docker system prune --volumes --force

# Docker
DOCKER_REGISTRY_USER := kolvin
OP_TOKEN_IDENTIFIER := GH_PAT_kolvin
PAT = $(shell op item get $(OP_TOKEN_IDENTIFIER) --fields credential)

DOCKER_REGISTRY_DOMAIN := ghcr.io
DOCKER_REGISTRY_URL := kolvin/semantic-release
IMAGE_FQDN := $(DOCKER_REGISTRY_DOMAIN)/$(DOCKER_REGISTRY_URL)
IMAGE_TAG := v0.0.1

build: ## Build service image
	$(info Make: building image...)
	@DOCKER_BUILDKIT=0 docker build . -t $(IMAGE_FQDN):$(IMAGE_TAG)

run: ## Run service image
	$(info Make: running $(IMAGE_FQDN):$(IMAGE_TAG)...)
	@docker run -it --rm $(IMAGE_FQDN):$(IMAGE_TAG)

push: ## Push service image to registry
	$(info Make: pushing image...)
	@docker push $(IMAGE_FQDN):$(IMAGE_TAG)

clean-run: ## build fresh and run
	@make -s build
	@make -s run

publish: ## publish docker image
	@make -s login
	@make -s build
	@make -s push

login: ## login to registry
	$(info Make: Logging into $(DOCKER_REGISTRY_DOMAIN).)
	@docker login $(DOCKER_REGISTRY_DOMAIN) -u $(DOCKER_REGISTRY_USER) -p $(PAT)
