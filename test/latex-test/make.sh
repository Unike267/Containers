#!/usr/bin/env bash

cd $(dirname "$0")

set +e
latexmk --shell-escape -pdf -f -interaction=nonstopmode -jobname=latex-test main.tex > log.log 2>&1
set -e
latexmk -c -pdf latex-test.pdf
