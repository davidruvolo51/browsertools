#' \code{hide_elem}
#'
#' Hides an html element by id or class name.
#'
#' @param elem the id or class name of an html elem to hide
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Hide Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to hide the message below."
#'           ),
#'           tags$button(
#'               id = "hideElement",
#'               class = "shiny-bound-input action-button",
#'               "Hide Element"
#'           ),
#'           tags$p(
#'               id = "myMessage",
#'               "Hide this message!"
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$hideElement, {
#'           browsertools::hide_elem(
#'               elem = "#myMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [show_elem()], [toggle_elem()], [hidden()]
#' @keywords browsertools hide
#' @return hide an HTML element
#'
#' @export
hide_elem <- function(elem) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "hide_elem",
        message = list(
            elem = elem
        )
    )
}