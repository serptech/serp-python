#!/bin/bash
set -euxo pipefail

poetry build
poetry publish
