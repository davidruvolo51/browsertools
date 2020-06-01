#' \code{hidden}
#'
#' Hide elements by when rendered
#' @return Hide elements by when rendered
#' @param ... A series HTML elements
#' @param css An optional class name used to hide elements
#'          (Default class = "browsertools")
#' @examples
#' hidden(tags$p("hello, world"), tags$p("this is a test"))
#' @keywords browsertools, hidden
#' @importFrom purrr, map
#' @importFrom rlang, list2
#' @export
hidden <- function(..., css = "browsertools-hidden") {

    # validate
    if (is.null(css)) stop("argument 'css' cannot be empty")

    # modify elements
    args <- list2(...)
    elems <- map(args, function(d) {
        d$attribs$class <- paste0(d$attribs$class, " ", css)
        d$attribs$`aria-hidden` <- "true"
        return(d)
    })
    return(elems)
}