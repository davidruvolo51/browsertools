#' \code{remove_element}
#'
#' Removes an html element from the DOM
#'
#' @param elem an ID of the element to remove
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Remove Element Example"),
#'     tags$p(
#'       id = "textToRemove",
#'       "Click the button below to remove this message."
#'     ),
#'     tags$button(
#'       id = "removeMessage",
#'       class = "shiny-bound-input action-button",
#'       "Remove Message"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeMessage, {
#'       browsertools::remove_element(
#'         elem = "#textToRemove"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [inner_html()], [insert_adjacent_html()]
#' @keywords browsertools remove element
#' @return Removes an html element from the DOM
#'
#' @export
remove_element <- function(elem) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "remove_element",
        message = list(
            elem = elem
        )
    )
}