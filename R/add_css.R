#' Add CSS
#'
#' Adds a css class(es) to an element using id or classname.
#'
#' @param elem the id or class name of an html element
#' @param css a string or character array containing css classes
#'
#' @return Adds a css class(es) to an element using id or classname.
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
#'           }",
#'          ".font-size-lg" {
#'             font-size: 150%;
#'          }
#'        )
#'     ),
#'     tags$main(
#'        tags$h2("Add CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          "Click the button below to change the text color to blue"
#'        ),
#'        tags$button(
#'           id = "addCSS",
#'           class = "shiny-bound-input action-button",
#'           "Add CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$addCSS, {
#'        browsertools::add_css(
#'          elem = "#my-text-example",
#'          css = c("blue-text", "font-size-lg")
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/add}
#'
#' @seealso [remove_css()], [toggle_css()]
#' @keywords browsertools css add
#' @export
add_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "add_css",
        message = list(
            elem = elem,
            css = css
        )
    )
}