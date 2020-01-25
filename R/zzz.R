# on load
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath(
        prefix = "assets",
        directoryPath = system.file(
            "assets",
            package = "shinytools"
        )
    )
}

# on unload
.onUnload <- function(libname, pkgname) {
    shiny::removeResourcePath(
        prefix = "assets"
    )
}