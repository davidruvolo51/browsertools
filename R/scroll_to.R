#' \code{scroll_to}
#'
#' Scrolls the window to the top of the page, user defined coordinates, or
#' a specific element. The default behavior of this function is to scroll
#' to the top of the page (x: 0, y: 0). You can also use an element's selector
#' path instead.
#'
#' @param x amount (in pixels) to scroll along the horizontal axis
#'          starting from the top left (default: 0)
#' @param y amount (in pixels) to scroll along the vertical axis
#'          starting from the top left (default: 0)
#' @param elem a selector path of an element that you would like to scroll
#'          to (i.e., id, class, tag, etc.). Using elem will override any
#'          coordinates.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'         tags$style(
#'             "#spacing{
#'                 height: 1200px;
#'               }"
#'         )
#'     ),
#'     tags$h2("Document Scrolling"),
#'     tags$p("Click the button at the bottom of the page"),
#'     tags$div(
#'         id = "spacing",
#'         `aria-hidden` = "true"
#'     ),
#'     tags$button(
#'        id = "appScroll",
#'        class = "shiny-bound-input action-button",
#'        "Scroll to Top"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$appScroll, {
#'         browsertools::scroll_to()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @keywords browsertools scroll
#' @return Scrolls the window to the top of the page or a user
#'          defined coordinates
#'
#' @export
scroll_to <- function(x = 0, y = 0, elem = NULL) {

    # validate
    if (!is.numeric(x)) stop("argument 'x' must be numeric")
    if (!is.numeric(y)) stop("argument 'y' must be numeric")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "scroll_to",
        message = list(
            x = x,
            y = y,
            elem = elem
        )
    )
}