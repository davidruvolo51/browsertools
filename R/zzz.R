# on load
.onLoad <- function(libname, pkgname) {
    addResourcePath(
        prefix = "browsertools",
        directoryPath = system.file(
            "browsertools",
            package = "browsertools"
        )
    )
}

# on unload
.onUnload <- function(libname, pkgname) {
    removeResourcePath("browsertools")
}