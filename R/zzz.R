#' onLoad
#'
#' Add Package Assets
#'
#' @param libname required shiny arguments
#' @param pkgname required shiny arguments
#'
#' @noRd
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath(
        prefix = "browsertools",
        directoryPath = system.file(
            "browsertools",
            package = "browsertools"
        )
    )
}

#' on unload
#'
#' Detach assets
#'
#' @param libname required shiny arguments
#' @param pkgname required shiny arguments
#'
#' @noRd
.onUnload <- function(libname, pkgname) {
    shiny::removeResourcePath("browsertools")
}