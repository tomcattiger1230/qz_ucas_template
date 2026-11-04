# 泉州装备制造研究所 / 福州大学 论文 LaTeX 模版

一个仓库收纳本课题组的四类文档模版。四个文档相互独立、各编各的，共用同一套 `style/`（文档类与宏包）、`bib/`（参考文献样式与共用文献池）和 `images/` 目录：

| 文档 | 主文件 | 说明 |
|---|---|---|
| 研究生开题（本所/国科大版） | `proposal.tex` | 研究生开题请参照本文件 |
| 研究生开题（福州大学版） | `proposal_fzu.tex` | 空白骨架，版式对齐福大开题报告 Word 模板，填写指引见 [README_fzu.md](README_fzu.md) |
| 中期报告 | `midterm_report.tex` | |
| 毕业论文 | `thesis.tex` | 毕业论文请参照本文件 |

Style files are stored in _style_ folder.

## 编译

全部文档统一用 **XeLaTeX** 引擎，在仓库根目录执行：

```bash
latexmk                    # 一键编译全部四个文档（读 latexmkrc，自动跑 bibtex）
latexmk proposal_fzu.tex   # 只编译其中一个
```

福大开题也可用专用脚本：Windows 双击 `build_fzu.bat`，macOS / Linux 执行 `./build_fzu.sh`。其余文档沿用 `artratex.bat` / `artratex.sh`。

## Thanks

这个项目要感谢 Huangrui Mo 的下列资源

https://github.com/mohuangrui/ucasthesis

https://github.com/mohuangrui/latexspine

https://github.com/mohuangrui/ucasproposal
