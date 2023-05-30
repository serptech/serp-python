#!/bin/bash
set -euxo pipefail

poetry run isort --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=79 serp_onpremise/ tests/
poetry run black serp_onpremise/ tests/ -l 79
