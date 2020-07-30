#' \code{console_error}
#'
#' Send an error message to the brower's console
#'
#' @param message a string containing an error to display
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display an Error Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendError",
#'        class = "shiny-bound-input action-button",
#'        "Send Error"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendError, {
#'         browsertools::console_error(
#'             message = "This is an error message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/error}
#' @seealso [console_warn()], [console_log()], [console_table()], [alert()]
#' @keywords browsertools debugging console
#' @return Sends an error message to the browser's console
#' @export
console_error <- function(message) {
    if (is.null(message)) stop("argument 'message' is undefined")
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "console_error",
        message = message
    )
}