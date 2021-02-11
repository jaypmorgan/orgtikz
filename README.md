# orgtikz

Create latex figures for Org-mode

## Installation

There is a no published package on CRAN yet, so you can install directly from this github repo:

```R
devtools::install_github("jaypmorgan/orgtikz")
```

## Creating a basic figure

```R
# import the package
library(orgtikz)

# create the orgmode figure string
tex.figure("/path/to/tex/file",
           fig.caption="My cool figure",
           fig.label="fig:my_cool_figure")

# [1] "\\begin{figure}[t]\n\\centering\n\\input{/path/to/tex/file}\n\\caption{My cool figure}\n\\label{fig:my_cool_figure}\n\\end{figure}"


# create a subfigure with two images
fig1 <- tex.figure("/path/to/tex/file", is.subfigure=TRUE, subfigure.scale=0.45)
fig2 <- tex.figure("/path/to/other/file", is.subfigure=TRUE, subfigure.scale=0.45)
string.figure(paste0(fig1, fig2), fig.caption="Two figures")

#  [1] "\\begin{figure}[t]\n\\centering\n\\begin{subfigure}[t]{0.45\\textwidth}\n\\centering\n\\input{/path/to/tex/file}\n\\caption{My figure}\n\\label{fig:my_figure}\n\\end{subfigure}\\begin{subfigure}[t]{0.45\\textwidth}\n\\centering\n\\input{/path/to/other/file}\n\\caption{My figure}\n\\label{fig:my_figure}\n\\end{subfigure}\\caption{Two figures}\n\\label{fig:my_figure}\n\\end{figure}"
```

This function will return the latex figure as a string, to which you can export as a latex string in org mode.
