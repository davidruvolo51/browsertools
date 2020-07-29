#' \code{console_table}
#'
#' Display data in the browser's console as a data table. By default, this
#' function transforms input data object as a JavaScript function using the
#' function `as_js_object` (also included in this package). Alternatively,
#' you can pass in a list object and set `to_json` to `FALSE`.
#'
#' @param data an object to display in the browser (data.frame, etc.)
#' @param to_json If TRUE, data will be converted to a JS object
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tagList(
#'      browsertools::use_browsertools(),
#'      tags$p("Open the browser's dev console")
#'  )
#'  server <- function(input, output, session) {
#'      n <- 10
#'      df <- data.frame(
#'          group = sample(letters, n),
#'          x = rnorm(n),
#'          y = rnorm(n),
#'          z = rnorm(n)
#'      )
#'      browsertools::console_table(data = df)
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/table}
#'
#' @seealso [as_js_object()], [console_log()], [alert()]
#' @keywords browsertools debugging console
#' @return Outputs an object to the browser's console
#'
#' @export
console_table <- function(data, to_json = TRUE) {

    # validate
    if (is.null(data)) stop("argument 'data' is undefined")
    if (to_json) data <- as_js_object(data)

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "console_table",
        message = data
    )
}