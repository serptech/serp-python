#!/bin/bash
set -euxo pipefail

./scripts/lint.sh
poetry run pytest -s --cov=serp_onpremise/ --cov=tests --cov-report=term-missing ${@-} --cov-report xml
