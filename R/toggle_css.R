#' \code{toggle_css}
#'
#' Toggles a css state of an html element
#'
#' @param elem the id or class name of an html element
#' @param css a string or character array containing css classes
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'        tags$style(
#'           ".blue-text {
#'             color: blue;
#'           }"
#'        )
#'     ),
#'     tags$main(
#'        tags$h2("Toggle CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          "Click the button below to toggle the text color."
#'        ),
#'        tags$button(
#'           id = "toggleCSS",
#'           class = "shiny-bound-input action-button",
#'           "Toggle CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$toggleCSS, {
#'        browsertools::toggle_css(
#'          elem = "#my-text-example",
#'          css = "blue-text"
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/toggle}
#'
#' @seealso [remove_css()], [add_css()]
#' @keywords browsertools toggle css
#' @return Toggles a css state of an html element
#'
#' @export
toggle_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "toggle_css",
        message = list(
            elem = elem,
            css = css
        )
    )
}