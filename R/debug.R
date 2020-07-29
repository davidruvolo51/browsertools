
#' \code{debug}
#'
#' Print JavaScript errors in the R console. This may be useful for debugging
#' errors that may arise when using functions included in this pacakge. For
#' example, if an element cannot be found using the `add_css` function, the
#' `debug` function will print the corresponding error.
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'     tags$head(
#'       tags$style(
#'         ".blue-text {
#'           color: blue;
#'         }"
#'       )
#'     )
#'     tags$h2("Browsertools demo"),
#'     tags$p(
#'       id = "txt",
#'       "JavaScript messages will print in the R Console"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     browsertools::debug()
#'     browsertools::add_css(
#'       elem = "#t",
#'       css = "blue-text"
#'     )
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [console_log()], [console_error()], [console_warn()], [alert()], [print_elem()]
#' @keywords browsertools debug error
#' @return Print JavaScript errors in the R console
#'
#' @export
debug <- function() {

    # session
    session <- shiny::getDefaultReactiveDomain()

    # send
    session$sendCustomMessage(
        type = "browsertools_debug",
        message = list(
            debug = TRUE
        )
    )

    # receive
    input <- session$input
    shiny::observeEvent(input$browsertools_debug, {
        e <- jsonlite::fromJSON(input$browsertools_debug)
        warning(
            "Error in ", e$func, ":\n  ", e$name, ": ", e$message,
            call. = FALSE
        )
    })
}