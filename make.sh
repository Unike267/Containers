#!/usr/bin/env bash

cd $(dirname "$0")

set +e
latexmk --shell-escape -pdf -f -interaction=nonstopmode -jobname=Impl-FLOS-UG main.tex > log.log 2>&1
set -e
latexmk -c -pdf Impl-FLOS-UG.pdf

