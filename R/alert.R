#' \code{alert}
#'
#' Send an alert dialog to the browser
#'
#' @param message a message to send
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display an alert"),
#'     tags$p("Click the button below to display an alert."),
#'     tags$button(
#'        id = "alert",
#'        class = "shiny-bound-input action-button",
#'        "Display Alert"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$alert, {
#'         browsertools::alert(
#'             message = "This is an alert"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Window/alert}
#' @seealso [console_error()], [console_warn()], [console_log()], [console_table()]
#' @keywords browsertools alert
#' @return Send an alert dialog to the browser
#' @export
alert <- function(message) {

    # validate
    if (is.null(message)) stop("argument 'message' cannot be empty")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "alert",
        message = list(
            message = message
        )
    )
}