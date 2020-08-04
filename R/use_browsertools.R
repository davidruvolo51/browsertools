#' \code{use_browsertools}
#'
#' Function that loads the browsertools JavaScript file into your shiny app.
#' This function is required and should be called at the top of the
#' Shiny app. If you are using other ShinyUI layouts, you may need to wrap
#' your app in `tagList`. (The size of the js file is approximately 5.1kb.)
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Hello, world!")
#'   )
#'   server <- function(input, output, session) {
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @keywords browsertools use initial setup
#' @return Function that loads all assets into your shiny app
#'
#' @export
use_browsertools <- function() {
    htmltools::htmlDependency(
        name = "browsertools",
        version = "0.1.73",
        src = "browsertools/",
        package = "browsertools",
        script = "browsertools.min.js",
        all_files = FALSE
    )
}