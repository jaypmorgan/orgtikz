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

# create a subfigure with two images
fig1 <- tex.figure("/path/to/tex/file", is.subfigure=TRUE, subfigure.scale=0.45)
fig2 <- tex.figure("/path/to/other/file", is.subfigure=TRUE, subfigure.scale=0.45)
str.figure(pase0(fig1, fig2), fig.caption="Two figures")
```

This function will return the latex figure as a string, to which you can export as a latex string in org mode.
