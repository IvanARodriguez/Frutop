# Variables
COMPOSE_FILE=docker-compose.yml

# Default Target (help command)
.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  dev         Build and run the app in development mode"
	@echo "  prod        Build and run the app in production mode"
	@echo "  down        Stop and remove all running containers"
	@echo "  logs        Show logs from all containers"
	@echo "  rebuild-dev Rebuild and restart in development mode"
	@echo "  rebuild-prod Rebuild and restart in production mode"

# Development Mode
.PHONY: dev
dev:
	@docker compose up --build

# Production Mode
.PHONY: prod
prod:
	@docker-compose up --build

# Stop and remove containers
.PHONY: down
down:
	@docker-compose down

# Logs from all containers
.PHONY: logs
logs:
	@docker-compose logs -f

# Rebuild in development
.PHONY: rebuild-dev
rebuild-dev:
	@docker compose down
	@docker compose up

# Rebuild in production
.PHONY: rebuild-prod
rebuild-prod:
	@docker-compose down
	@docker-compose up --build
