#' \code{console_warn}
#'
#' Send a warning message to the console
#'
#' @param message a message to display
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display Warning Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendWarning",
#'        class = "shiny-bound-input action-button",
#'        "Send Warning"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendWarning, {
#'         browsertools::console_warn(
#'             message = "This is a warning message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'      \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/warn}
#'
#' @seealso [console_error()], [console_log()], [console_table()], [alert()]
#' @keywords browsertools console warn
#' @return Outputs a warning message to the console
#'
#' @export
console_warn <- function(message) {

    # validate
    if (is.null(message)) stop("argument 'message' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "console_warn",
        message = message
    )
}