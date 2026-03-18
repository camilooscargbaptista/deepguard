.PHONY: install dev test lint format architect architect-score clean analyze

# --- Setup ---
install:
	pip install -e .

dev:
	pip install -e ".[dev]"

# --- Quality ---
test:
	pytest tests/ -v --tb=short

lint:
	mypy src/deepguard/ --ignore-missing-imports
	isort --check-only src/
	black --check src/

format:
	isort src/
	black src/

# --- Architecture Governance (via @girardelli/architect) ---
architect:
	npx @girardelli/architect analyze ./src --format html --output docs/architecture-report.html

architect-score:
	npx @girardelli/architect score ./src

architect-anti-patterns:
	npx @girardelli/architect anti-patterns ./src

# --- Analysis ---
analyze:
	deepguard analyze $(IMAGE) --output /tmp/deepguard-report.html

# --- Build ---
clean:
	rm -rf dist/ build/ *.egg-info src/*.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
