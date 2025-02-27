


# 一个简洁优雅的 XeLaTeX 简历模板

Hit branch [master](https://github.com/billryan/resume/tree/master) if you wanna an English résumé.

本简历模板基于上述英文简历制作。

\LaTeX 的简历模板其实是有不少的，坊间流传较广的有 `moderncv`, 这货使用起来比较简单，样式改起来也很方便，但是不太适合作为一页纸简历模板，因为空白太多了。传统的 `resume` 宏包虽然适合用作一页纸简历，但是定制起来比较麻烦，需要懂不少 \TeX 语法。

看了不少其他人的简历模板总觉得差点意思，不是字体不好看就是排版的布局不符合自己的审美。一方面又想加点炫技小花样一方面又怕到时候掏简历的时候HR觉得太花哨了。

受以下项目启发：

- [zachscrivena/simple-resume-cv](https://github.com/zachscrivena/simple-resume-cv)
- [res](https://www.ctan.org/pkg/res)
- [JianXu's CV](http://www.jianxu.net/en/files/JianXu_CV.pdf)
- [Web Front-End Wenli Zhang.pdf](http://zhangwenli.com/cv/Web%20Front-End%20Wenli%20Zhang.pdf)
- [paciorek's CV/Resume template](http://www.stat.berkeley.edu/~paciorek/computingTips/Latex_template_creating_CV_.html)
- [How to write a LaTeX class file and design your own CV (Part 1) - ShareLaTeX](https://www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html)

其中最后一条 shareLaTeX 的总结清晰易懂，强烈建议围观。接下来介绍模板使用细节和定制说明。

## 简介

该简历模板使用 `\XeLaTeX` 编译，无痛支持中文，开箱即用(几乎不需要懂 `\LaTeX` 语法)。

主要的功能如下：

- 极其容易定制和扩展。
- 完善的 Unicode 字体支持，因为用的是 XeLaTeX 嘛
- 完美的简体中文支持，默认使用 adobefonts 的四套简体中文字型，其他字型可自行添加。
- 支持图标字体 FontAwesome 4.6.3

### 样例输出

![简体中文](https://github.com/eilidan/LaTeX-resume/示例图片.png)

## 使用方法

### 使用较新的 TeX 发行版在本地计算机编译

除了在线编译外，该模板当然也支持传统的本地编译，从 <https://github.com/eilidan/LaTeX-resume.git> 上克隆下来使用 XeLaTeX 编译即可。

```tex
xelatex resume.tex % 编译英文简历
xelatex resume_photo.tex % 编译带照片的简历
xelatex resume-zh_CN.tex % 编译中文简历
```

### 中英文双语支持

\LaTeX 的中文支持一直是不少 TeX 新手心中的梦魇，该简历模板最大的特色就是『无痛』支持中英文双语，『无痛』的含义是指开箱即用——在线或者克隆到本地后只需要更改自己的信息即可，不需要自己设置中文字体支持等操作。


中文使用UTF-8编码，对于大多数 Windows 用户来说，只要使用的不是太老的 CTeX 发行版，WinEdt 的中文支持也是毫无压力的。
编译时务必使用 \XeLaTeX，其他编译方式会报错，因为依赖了 \XeTeX 的一些东西。

### 中英文切换

英文模板范例见 <https://github.com/billryan/resume/blob/zh_CN/resume.tex> 
中文模板范例见 <https://github.com/billryan/resume/blob/zh_CN/resume-zh_CN.tex>

中文模板与英文模板的区别仅有两行——使用中文时仅需反注释以下两行，模板中已默认启用，第一次编译时耗时相对较长(引入了外部中文字型)，耐心等待下。

```tex
\usepackage{zh_CN-Adobefonts_external} % Simplified Chinese Support using external fonts (./fonts/zh_CN-Adobe/)
%\usepackage{zh_CN-Adobefonts_internal} % Simplified Chinese Support using system fonts
\usepackage{linespacing_fix} % disable extra space before next section
```

对于高级用户：如果系统已确定安装有 Adobe 的四套中文字型，在文档的开始处使用包`zh_CN-Adobefonts_internal`，这样第一次编译时也会很快。

### 参考文献

参考文献的引用采用 bib + bst 的方式管理，bib 中存放 BibTeX 格式的引用文本，bst 用于控制 bib 文件的展示形式，默认为 IEEEtran. 编译方式可选如下：

1. OSX/Linux 用户 `latexmk -pdf -pvc -silent myresume-zh_CN.tex` latexmkrc 配置文件可参考我的 [dotfiles/latexmkrc](https://github.com/billryan/dotfiles/blob/master/latex/latexmkrc)
2. Windows 用户可使用 WinEdt 中的 TeXify 选项编译(未测试)

除了以上两种编译方式，你还可以使用传统的编译方式：

```shell
xelatex myresume-zh_CN
bibtex myresume-zh_CN
xelatex myresume-zh_CN
xelatex myresume-zh_CN
```

范例文档中默认Reference 另起一页，想留在当前页的可注释掉`\newpage`

### 宏

普通用户直接使用模板中的宏即可，具体排版使用可直接参考范例 tex 文档，已经十分简洁了。
想自己添加新的宏的可以先看看 [How to write a LaTeX class file and design your own CV (Part 1) - ShareLaTeX](https://www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html) 和 [How to write a LaTeX class file and design your own CV (Part 2) - ShareLaTeX](https://www.sharelatex.com/blog/2013/06/28/how-to-write-a-latex-class-file-and-design-your-own-cv.html) 了解下该模板的简单背景。


- `\section`: 用于分节, 如教育背景, 实习/项目经历等
- `\subsection`: 用于小节标题, 无日期选项
- `\datedsubsection`: 用于小节标题, 简历中使用最广，第二项为时间区间，自动右对齐
- `\itemize`: 清单列表，简历中应用最广
- `\enumerate`: 枚举列表，数字标号

### FontAwesome

本模板使FontAwesome5，在本机终端输入texdoc fontawesome5即可调出使用手册，看中哪个图标就替换图标的名字即可。

### 实践参考

这里列举一下其他同学基于本模板的具体**实践心得**, 大家可以自行参考, 也欢迎<u>提交贡献</u>, 分享你的心得:

- [用 Tex 书写优雅的简历 – Jin’s Blog](https://www.imbajin.com/2018-01-20-%E4%BD%BF%E7%94%A8Tex%E4%B9%A6%E5%86%99%E4%BC%98%E9%9B%85%E7%9A%84%E7%AE%80%E5%8E%86/) (简单介绍tex + 常见样式调整)

## License

[The MIT License (MIT)](http://opensource.org/licenses/MIT)

Copyrighted fonts are not subjected to this License.

## 总结

\LaTeX 的中文支持除了在系统配置文件内指定外还可以在当前项目内指定，这种方式适合大范围分发，正是这个模板中采用的方式，缺点就是大部分中文字型都是有版权的，使用上需要注意。在制作这个模板的过程中还发现合理使用 \LaTeX 现代宏包能大大减轻后期维护和升级的工作，需要使用的命令更少更清晰。ShareLaTeX 网站上有很多简单易懂的范例，当教材来使都不过分。\LaTeX 中文方面的教程精品的不多，刘海洋老师的《LaTeX 入门》 算是精品中的精品！

这个模板看似复杂，其实使用上极其省心，想在我这个模板的基础上改动样式的可以看相应的 cls 文件和详细说明，只是简单使用的话直接在范例文档的基础上改改即可。
总的来说这个模板适合找工作用，而且是偏技术型的一页纸简历。

祝大家玩的开心 :)
