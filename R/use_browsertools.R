#' \code{use_browsertools}
#' Function that loads all assets into your shiny app
#' @return Function that loads all assets into your shiny app
#' @keywords browsertools, use
#' @examples
#' browsertools::use_browsertools()
#' @export
use_browsertools <- function() {
    htmltools::htmlDependency(
        name = "browsertools",
        version = "0.1.41",
        src = "browsertools/",
        package = "browsertools",
        script = "js/browsertools.min.js",
        stylesheet = "css/browsertools.min.css",
        all_files = FALSE
    )
}