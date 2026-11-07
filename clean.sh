#!/usr/bin/env bash
# 清理此模板的中间文件，默认保留成品。
set -euo pipefail
cd "$(dirname "$0")"
if command -v latexmk >/dev/null 2>&1; then
  latexmk -c -outdir=build main.tex >/dev/null 2>&1 || true
  latexmk -c main.tex >/dev/null 2>&1 || true
fi
rm -f main.aux main.log main.out main.toc main.nav main.snm main.vrb \
      main.xdv main.fls main.fdb_latexmk main.run.xml main.bcf main.synctex.gz
if [ "${1:-}" = "--deep" ]; then
  rm -f main.pdf build/main.pdf main.bbl build/main.bbl
fi
printf '已清理编译中间文件。\n'
