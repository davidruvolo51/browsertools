#' \code{run_demo}
#'
#' Start the browsertools demo app
#' @return Start the browsertools demo app
#' @examples
#' browsertools::run_demo()
#' @importFrom shiny runApp
#' @keywords browsertools demo
#' @export
run_demo <- function() {
    path <- system.file("browsertools-demo", package = "browsertools")
    if (path == "") stop("Demo app does not exist.", call. = FALSE)
    runApp(path, display.mode = "normal")
}