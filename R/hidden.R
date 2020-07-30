#' \code{hidden}
#'
#' Hide an element or elements by default (i.e., at the time of page render)
#'
#' @param ... A Shiny tag element or a tagList object
#' @param css An optional class name used to hide elements
#'          (Default class = "browsertools")
#' @examples
#' if (interactive()) {
#'  hidden(tags$p("hello, world"), tags$p("this is a test"))
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Hidden Elements"),
#'     tags$p("This element is visible by default"),
#'     browsertools::hidden(
#'       tags$p(
#'         id = "myHiddenElement",
#'         "This element is hidden by default"
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @keywords browsertools hidden
#' @return Hide elements by when rendered
#'
#' @export
hidden <- function(..., css = "browsertools-hidden") {

    # validate
    if (is.null(css)) stop("argument 'css' cannot be empty")

    # modify elements
    args <- rlang::list2(...)
    elems <- purrr::map(args, function(d) {
        d$attribs$class <- paste0(d$attribs$class, " ", css)
        d$attribs$`aria-hidden` <- "true"
        return(d)
    })
    return(elems)
}