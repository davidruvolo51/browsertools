#' \code{use_browsertools}
#'
#' Function that loads all package assets into your shiny app (css and js
#' file). This function is required and should be called at the top of the
#' Shiny app. If you are using other ShinyUI layouts, you may need to wrap
#' your app in `tagList`.
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
        version = "0.1.72",
        src = "browsertools/",
        package = "browsertools",
        script = "js/browsertools.min.js",
        stylesheet = "css/browsertools.min.css",
        all_files = FALSE
    )
}