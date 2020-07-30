#' \code{run_demo}
#'
#' Start the browsertools demo app
#'
#' @examples
#' if (interactive()) {
#'   browsertools::run_demo()
#' }
#' @keywords browsertools demo
#' @return Start the browsertools demo app
#' @export
run_demo <- function() {
    path <- system.file("browsertools-demo", package = "browsertools")
    if (path == "") stop("Demo app does not exist.", call. = FALSE)
    shiny::runApp(path, display.mode = "normal")
}