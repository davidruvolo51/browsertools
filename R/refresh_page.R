#' \code{refresh_page}
#'
#' Trigger a page refresh
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'      browsertools::refresh_page(),
#'      tags$h2("Refresh App Example"),
#'      tags$p("Click the button to refresh the app"),
#'      tags$button(
#'          id = "refreshApp",
#'          class = "shiny-bound-input action-button",
#'          "Resfresh App"
#'      )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$refreshApp, {
#'       browsertools::refresh_page()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @keywords browsertools page refresh
#' @return Trigger a page refresh
#'
#' @export
refresh_page <- function() {
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "refresh_page",
        message = ""
    )
}