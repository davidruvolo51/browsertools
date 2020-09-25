#' ////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-29
#' MODIFIED: 2020-09-25
#' PURPOSE: package management
#' STATUS: ongoing
#' PACKAGES: usethis; pkgbump
#' COMMENTS: NA
#' ////////////////////////////////////////////////////////////////////////////

# init
usethis::use_namespace()
usethis::use_description()
usethis::use_news_md()
usethis::use_github_action_check_standard()
usethis::use_travis()

#' ~ 0 ~
#' Set Dependencies

# pkgs
usethis::use_package(package = "htmltools", min_version = "0.4.0")
usethis::use_package(package = "shiny", min_version = "1.4.0")
usethis::use_package(package = "rlang", min_version = "0.4.7")
usethis::use_package(package = "purrr", min_version = "0.3.4")
usethis::use_package(package = "jsonlite", min_version = "1.7.0")

#' //////////////////////////////////////

#' ~ 1 ~
#' Package Ignores

# ignore git
gitignore <- c(
    ".Rhistory",
    ".RData",
    ".Rproj.user",
    ".DS_STORE",
    "node_modules",
    "yarn-error.log"
)

# add
usethis::use_git_ignore(ignores = gitignore)
usethis::use_build_ignore(
    files = c(
        gitignore,
        ".github",
        "config",
        "dev",
        "inst/browsertools/src",
        ".babelrc",
        ".gitignore",
        ".pkgbump.json",
        ".travis.yml",
        "browsertools.code-workspace",
        "package.json",
        "postcss.config.js",
        "webpack.config.js",
        "yarn.lock"
    )
)


# pkgbump
pkgbump::set_pkgbump(
    files = c(
        "DESCRIPTION",
        "R/use_browsertools.R",
        "package.json"
    )
)

pkgbump::pkgbump(version = "0.1.8")

#' //////////////////////////////////////

#' ~ 3 ~
#' Build


# run checks
devtools::check_man()
devtools::check()

# for local testing
devtools::load_all()


# run dev app
shiny::runApp(appDir = "./dev/dev-app/", port = 8000, launch.browser = FALSE)

# run test app
shiny::runApp(appDir = "./dev/test-app/", port = 9000, launch.browser = FALSE)