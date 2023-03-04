#!/bin/bash
set -euxo pipefail

poetry run mypy --disallow-untyped-defs --ignore-missing-imports orbl_onpremise/
poetry run isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=79 --check --diff orbl_onpremise/ tests/
poetry run black --check -l 79 orbl_onpremise/ tests/
poetry run flake8 orbl_onpremise/ --max-line 79 --ignore F403,F401,W503,E203
poetry run bandit -r orbl_onpremise/
