#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build
latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=build main.tex
cp build/main.pdf main.pdf
printf '已生成 main.pdf\n'
