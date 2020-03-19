# on load
.onLoad <- function(libname, pkgname) {
    addResourcePath(
        prefix = "assets",
        directoryPath = system.file(
            "assets",
            package = "browsertools"
        )
    )
}

# on unload
.onUnload <- function(libname, pkgname) {
    removeResourcePath("assets")
}