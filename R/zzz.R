# on load
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath(
        prefix = "assets",
        directoryPath = system.file(
            "assets",
            package = "browsertools"
        )
    )
}

# on unload
.onUnload <- function(libname, pkgname) {
    shiny::removeResourcePath("assets")
}