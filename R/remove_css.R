#' \code{remove_css}
#'
#' Removes a css class(es) to an element using id or classname.
#'
#' @param elem the id or class name of an html element
#' @param css a string containing the class(es) to remove from
#'            an html element
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
#'        tags$h2("Remove CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          class = "blue-text",
#'          "Click the button below to remove the blue color from the text"
#'        ),
#'        tags$button(
#'           id = "removeCSS",
#'           class = "shiny-bound-input action-button",
#'           "Remove CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$removeCSS, {
#'        browsertools::remove_css(
#'          elem = "#my-text-example",
#'          css = "blue-text"
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/remove}
#'
#' @seealso [add_css()], [toggle_css()]
#' @keywords browsertools css remove
#' @return Removes a css class(es) to an element using id or classname.
#'
#' @export
remove_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "remove_css",
        message = list(
            elem = elem,
            css = css
        )
    )
}