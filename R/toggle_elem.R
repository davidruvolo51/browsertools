
#' \code{toggle_elem}
#'
#' Toggle the visibility of an html element
#'
#' @param elem the id or class name of an html element
#' @param css a string containing the class to remove from an html element
#'          (default: browsertools-hidden; package default)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Toggle Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to toggle the hidden element."
#'           ),
#'           tags$button(
#'               id = "toggleElement",
#'               class = "shiny-bound-input action-button",
#'               "Toggle Element"
#'           ),
#'           browsertools::hidden(
#'               tags$p(
#'                   id = "hiddenMessage",
#'                   "You found the hidden message!"
#'               )
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$toggleElement, {
#'           browsertools::toggle_elem(
#'               elem = "#hiddenMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [hide_elem()], [show_elem()]
#' @keywords browsertools toggle element
#' @return Toggle the visibility of an html element
#' @export
toggle_elem <- function(elem, css = "browsertools-hidden") {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "toggle_elem",
        message = list(
            elem = elem,
            css = css
        )
    )
}