#!/usr/bin/env bash
# 用法：在本目录执行  ./build.sh
# 作用：XeLaTeX → BibTeX → XeLaTeX ×2，与 build.bat 等价
set -e
cd "$(dirname "$0")"

if ! command -v xelatex >/dev/null 2>&1; then
  echo "[错误] 没找到 xelatex。请先安装 TeX Live（macOS 可用 MacTeX），并确认它在 PATH 里。"
  exit 1
fi

echo "[1/4] xelatex pass 1 ..."
xelatex -interaction=nonstopmode proposal.tex > build_1.log 2>&1 || true

echo "[2/4] bibtex ..."
bibtex proposal > build_bib.log 2>&1 || true

echo "[3/4] xelatex pass 2 ..."
xelatex -interaction=nonstopmode proposal.tex > build_2.log 2>&1 || true

echo "[4/4] xelatex pass 3 ..."
xelatex -interaction=nonstopmode proposal.tex > build_3.log 2>&1 || true

if [ -f proposal.pdf ]; then
  echo "编译完成：$(pwd)/proposal.pdf"
  echo "如果排版不对，看 build_3.log 里以 \"!\" 开头的行。"
else
  echo "[失败] 没有生成 proposal.pdf，请查看 build_3.log。"
  exit 1
fi
