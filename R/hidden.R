#' \code{hidden}
#'
#' Hide an element or elements by default (i.e., at the time of page render)
#'
#' @param ... Shiny tag element(s) to hide
#'
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
hidden <- function(...) {
    args <- rlang::list2(...)
    elems <- purrr::map(args, function(d) {
        if (class(d) == "shiny.tag") {
            d$attribs$`hidden` <- ""
            return(d)
        }
    })
    return(elems)
}