#!/usr/bin/env bash
# 用法：在仓库根目录执行  ./build_fzu.sh
# 作用：编译福大开题报告 proposal_fzu.tex：XeLaTeX → BibTeX → XeLaTeX ×2，与 build_fzu.bat 等价
set -e
cd "$(dirname "$0")"

if ! command -v xelatex >/dev/null 2>&1; then
  echo "[错误] 没找到 xelatex。请先安装 TeX Live（macOS 可用 MacTeX），并确认它在 PATH 里。"
  exit 1
fi

echo "[1/4] xelatex pass 1 ..."
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_1.log 2>&1 || true

echo "[2/4] bibtex ..."
bibtex proposal_fzu > build_fzu_bib.log 2>&1 || true

echo "[3/4] xelatex pass 2 ..."
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_2.log 2>&1 || true

echo "[4/4] xelatex pass 3 ..."
xelatex -interaction=nonstopmode proposal_fzu.tex > build_fzu_3.log 2>&1 || true

if [ -f proposal_fzu.pdf ]; then
  echo "编译完成：$(pwd)/proposal_fzu.pdf"
  echo "如果排版不对，看 build_fzu_3.log 里以 \"!\" 开头的行。"
else
  echo "[失败] 没有生成 proposal_fzu.pdf，请查看 build_fzu_3.log。"
  exit 1
fi
