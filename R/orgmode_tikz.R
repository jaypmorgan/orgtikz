#' Export a latex figure from a tex file
#'
#' Create a latex figure using a tikz .tex file as the input
#' to the figure. This is useful for placing tikz figures into org-mode
#' files.
#'
#' @param inpath Filepath to the location of the tex file
#' @param fig.float Latex figure float modifiers as a string (e.g. "htbp", "!h")
#' @param fig.caption Latex figure caption
#' @param fig.label Latex figure label for referencing
#' @param is.subfigure Boolean value to create a subfigure instead of normal figure
#' @param subfigure.scale Set width of subfigure if is.subfigure is TRUE
#' @return A latex figure as a string
#' @export
tex.figure <- function(inpath, fig.float="t", fig.caption="My figure", fig.label="fig:my_figure", is.subfigure=FALSE, subfigure.scale=1.0) {
    if (is.subfigure == TRUE) {
        figure.string <- paste0("\\begin{subfigure}[", fig.float, "]{", subfigure.scale, "\\textwidth}\n")
    } else {
        figure.string <- paste0("\\begin{figure}[", fig.float, "]\n")
    }
    figure.string <- paste0(figure.string,
                            "  \\input{", inpath, "}\n",
                            "  \\caption{", fig.caption, "}\n",
                            "  \\label{", fig.label, "}\n",
                            "\\end{", ifelse(is.subfigure == TRUE, "subfigure", "figure"), "}")
    return(figure.string)
}

#' Export a latex figure from a string input
#'
#' Create a latex figure where the input to the function is a string.
#' This sets up the surrounding string.
#'
#' @param figure.string The string to use inside the figure block
#' @param fig.float Latex figure float modifiers as a string (e.g. "htbp", "!h")
#' @param fig.caption Latex figure caption
#' @param fig.label Latex figure label for referencing
#' @return The latex figure block as a string
#' @export
string.figure <- function(figure.string, fig.float="t", fig.caption="My figure", fig.label="fig:my_figure") {
    figure.string <- paste0("\\begin{figure}[", fig.float, "]\n",
                            figure.string,
                            "  \\caption{", fig.caption, "}\n",
                            "  \\label{", fig.label, "}\n",
                            "\\end{figure}")
    return(figure.string)
}
