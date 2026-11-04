# latexmk 配置：在仓库根目录执行 `latexmk` 即可一键编译全部四个文档（自动跑 bibtex）
# 也可指定单个文档，例如：latexmk proposal_fzu.tex
$pdf_mode = 5;                       # 5 = xelatex（全仓库文档统一用 XeLaTeX）
$xelatex = 'xelatex -interaction=nonstopmode %O %S';
@default_files = ('proposal.tex', 'proposal_fzu.tex', 'midterm_report.tex', 'thesis.tex');
$bibtex_use = 2;                     # 自动运行 bibtex，并清理 aux 残留
$out_dir = '.';
