#!/bin/bash
set -euxo pipefail

poetry run mypy --disallow-untyped-defs --ignore-missing-imports serp/
poetry run isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=79 --check --diff serp/ tests/
poetry run black --check -l 79 serp/ tests/
poetry run flake8 serp/ --max-line 79 --ignore F403,F401,W503,E203
poetry run bandit -r serp/
