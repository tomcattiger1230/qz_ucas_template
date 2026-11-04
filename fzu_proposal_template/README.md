# 福州大学 · 专业学位研究生论文开题报告（LaTeX 空白模板）

按福州大学开题报告 Word 模板（`FZU Body` / `FZU H1~H3` 样式）还原的 LaTeX 版式，页面、字体、行距、标题层级、图表编号、页脚「第 X 页 共 Y 页」都与学校模板对齐。

**这是一份空白骨架**：没有别人的选题、没有别人的文字和插图，只给结构 + 每节该写什么。五个一级标题是学校表格里定死的，已经在文件里写好，你只管往里填。

---

## 一、环境要求

| 项目 | 要求 |
|---|---|
| 引擎 | **必须 XeLaTeX**（pdflatex 处理不了中文，会直接报错） |
| 发行版 | Windows：MiKTeX 或 TeX Live；macOS：MacTeX；Linux：TeX Live |
| 字体 | Windows 自带宋体/黑体/仿宋/楷体即可；macOS 自动用宋体-简；都没有时自动回退到 TeX 随附的 Fandol，再退到 Noto CJK，**一般不用手动装字体** |
| 路径 | 解压后的路径**不要带空格和特殊符号**（Windows 上尤其要注意） |

---

## 二、怎么编译（三选一）

**方式 1：Windows 双击 `build.bat`**（最省事）

自动找 MiKTeX/TeX Live 的 bin 目录，跑 xelatex → bibtex → xelatex → xelatex，同目录生成 `proposal.pdf`。

**方式 2：latexmk 一键（macOS / Linux 推荐）**

```bash
latexmk        # 读 latexmkrc，自动 xelatex + bibtex + 重跑到目录页码稳定
latexmk -c     # 清理中间文件（保留 pdf）
```

macOS / Linux 也可以直接 `./build.sh`（等价于 build.bat）。

> Windows 注意：MiKTeX 的 `latexmk` 依赖 Perl，没装 Perl 会报 `Make sure 'perl' is installed`。这时用方式 1 或方式 3，效果一样。

**方式 3：手动四步**（出问题好排查）

```bash
xelatex proposal.tex
bibtex  proposal
xelatex proposal.tex
xelatex proposal.tex
```

> 顺序不能省：`bibtex` 生成参考文献，最后一遍 `xelatex` 才能把目录页码和「共 X 页」算准。只跑一遍一定会出现 `[?]` 和页码错误。

---

## 三、目录结构

```
.
├── proposal.tex                     ← 主文件：版式参数全在这（字体/行距/标题/页脚），一般不用改
├── build.bat / build.sh / latexmkrc ← 编译脚本
├── contents/
│   ├── frontinfo_proposal.tex       ← ① 封面信息：题目、姓名、学号、导师、专业、单位
│   ├── frontmatter_proposal.tex     ← 目录
│   ├── mainmatter_proposal.tex      ← ② 正文五章（要写的都在这，注释里是填写要点）
│   └── cover_table.tex              ← ③ 福大「表一」表格封面（默认关闭，见第五节）
├── bib/
│   ├── ref.bib                      ← ④ 参考文献条目（现在是空的）
│   ├── examples.bib                 ← 条目写法示例（不参与编译，复制到 ref.bib 里用）
│   └── gbt7714-numerical.bst        ← 国标参考文献样式（不要删）
└── images/
    ├── ucas_logo.pdf                ← 校徽（只在启用封面时用到）
    └── proposal/                    ← 正文插图放这里
```

---

## 四、填完只要五步

- [ ] **① 封面信息** → `contents/frontinfo_proposal.tex`，把每个 `×××` 换掉：`\title{}`、`\author{}`、`\authorid{}`、`\advisor{}`、`\advisortitle{}`、`\major{}`、`\field{}`、`\institute{}`。
- [ ] **② 正文** → `contents/mainmatter_proposal.tex`。每一节下面以 `%` 开头的注释就是「你该写什么」，按提示填；`×××` 都是占位符。
- [ ] **③ 参考文献** → 把 `bib/examples.bib` 里的条目复制到 `bib/ref.bib`，改成自己读过的文献；正文用 `\cite{key}` 引用。
- [ ] **④ 插图**（有就放）→ 图片丢进 `images/proposal/`，正文用 `\includegraphics[width=0.95\textwidth]{images/proposal/图名.jpg}`，写法见下方速查。
- [ ] **⑤ 表一封面**（交表时要）→ 把 `proposal.tex` 里 `\input{contents/cover_table}` 那行行首的 `%` 去掉，再把 `contents/cover_table.tex` 里的 `×××` 换成自己的信息。

> 五章标题别动：`一、论文选题依据` / `二、论文的研究内容、研究目标及拟解决的关键问题` / `三、拟采取的研究方案及可行性分析` / `四、本课题的特色与创新之处` / `五、参考文献`。这是学校表格里的固定栏，编号「一、二、三」由模板自动生成，**不要手打**。

---

## 五、常用写法速查

**引用文献**（`bib/ref.bib` 里定义的 key，自动排成上标编号）

```latex
视觉感知在工业检测中应用广泛\cite{example-journal}。
```

**插图**（图号自动按章编号，如「图 3-1」）

```latex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.95\textwidth]{images/proposal/route.jpg}
  \caption{技术路线图}
  \label{fig:route}
\end{figure}

如图~\ref{fig:route}所示，……
```

**表格**

```latex
\begin{table}[H]
  \centering
  \caption{实验条件对比}
  \label{tab:cond}
  \begin{tabular}{lccc}
    \hline
    项目 & 现有方法 & 本课题 & 备注 \\ \hline
    ××× & ××× & ××× & ××× \\ \hline
  \end{tabular}
\end{table}
```

**公式**（连续编号，不带章号）

```latex
\begin{equation}
  \label{eq:d}
  \mathbf{d}(x) = \arg\min_{\mathbf{d}} \left\| \nabla I(x+\mathbf{d}) - \nabla I_0(x) \right\|_2^2
\end{equation}

由式~\eqref{eq:d}可得……
```

**分条**：`\begin{itemize}` 用圆点，`\begin{enumerate}` 用数字，里面都写 `\item`。
**加粗小标题**：`\textbf{×××}`；创新点那种独立成段的用 `\proposalstep{（1）×××}`。

---

## 六、版式参数在哪调（一般不用动）

全在 `proposal.tex` 开头，注释里写了每个值的来历（都是 Word 模板里的 pt / twips）：

| 参数 | 现值 | 位置 |
|---|---|---|
| 页边距 | 上下 22mm、左右 20mm | `\geometry{...}` |
| 正文 | 小四 12pt，固定行距 20 磅 | `\linespread{1.389}\selectfont`（12pt×1.2×1.389≈20pt） |
| 首行缩进 | 2 字符（24pt） | `\setlength{\parindent}{24pt}` |
| 段后距 | 6 磅 | `\setlength{\parskip}{6pt ...}` |
| 一级标题 | 黑体四号 14pt 加粗，前后各 12 磅 | `\ctexset{section={...}}` |
| 二级/三级标题 | 黑体小四 12pt | `\ctexset{subsection={...}}` |
| 页脚 | 宋体小五 9pt，居中「第 X 页 共 Y 页」 | `\fancypagestyle{fzu}` |

行距系数别乱改：Word 模板是"固定行距 20 磅"，`1.389` 是换算结果，一改就和学校模板不一致。

---

## 七、常见问题

| 现象 | 原因 / 处理 |
|---|---|
| `xelatex: command not found` | 没装 TeX 或没进 PATH。装 MiKTeX / TeX Live 后重开终端；Windows 直接双击 `build.bat`，它会自己找安装目录 |
| 中文变方块/乱码 | 用了 pdflatex。必须 XeLaTeX（`build.bat` 已是；VS Code 换 recipe；Overleaf 在 Menu → Compiler 选 XeLaTeX） |
| 参考文献是空的 / 显示 `[?]` | 一是没跑 `bibtex`；二是正文没有 `\cite`（列表只显示被引用过的条目），三是 `ref.bib` 还没填 |
| 页脚「共 X 页」或目录页码不对 | 少跑一遍 xelatex，`\pageref{LastPage}` 要两遍才收敛 |
| `! Font ... not found` | 系统没有宋体。本版式已做三级字体回退；若仍报错，多半是 TeX 发行版太旧缺 `fandol`，装上即可 |
| MiKTeX 弹窗问是否安装宏包 | 选 Install（建议开启 `Always install missing packages on-the-fly`） |
| 报缺 `bicaption` / `ctable` / `tikz` | 模板依赖的宏包，MiKTeX 会自动装；TeX Live 建议 `texlive-full`，或至少 `texlive-lang-chinese texlive-latex-extra texlive-pictures` |
| 图片不显示 | 路径/扩展名写错，或图片没放进 `images/proposal/`；JPG/PNG/PDF 都可以 |
| 想用 Overleaf | 整包上传，Menu → Compiler 选 **XeLaTeX**，Main document 设为 `proposal.tex`。Overleaf 没有中文字体，会自动走 Fandol 回退，能编译但字形与宋体略有差别 |

---

## 八、最后两点

- 交表请**在本机**编译出 PDF，别用在线上平台生成的版本：字形、行距、断字都可能有细微差别。
- 编译出来先是几页骨架（目录 + 五章标题）是正常的，正文填多少它就有多少页。
