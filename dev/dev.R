#'////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-29
#' MODIFIED: 2020-07-29
#' PURPOSE: package management
#' STATUS: ongoing
#' PACKAGES: usethis
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# init
usethis::use_namespace()
usethis::use_description()
usethis::use_news_md()

#' ~ 0 ~
#' Set Dependencies

# pkgs
usethis::use_package(package = "htmltools", min_version = "0.4.0")
usethis::use_package(package = "shiny", min_version = "1.4.0")
usethis::use_package(package = "rlang", min_version = "0.4.7")
usethis::use_package(package = "purrr", min_version = "0.3.4")

#'//////////////////////////////////////

#' ~ 1 ~
#' Package Ignores

# ignore git
git <- c(
    ".Rproj.user",
    ".Rhistory",
    ".RData",
    ".Ruserdata",
    "node_modules/"
)

# ignore r build
rbuild <- c(

    # include git
    git,

    # dirs
    "dev/",
    ".github",

    # file extensions
    "[*.yml]",
    "[*.code-workspace]",
    "[*.lock]",

    # named files
    ".babelrc",
    ".postcssrc",
    ".gitignore"
)


# add
usethis::use_git_ignore(ignores = git)
usethis::use_build_ignore(files = rbuild)

#'//////////////////////////////////////

#' ~ 2 ~
#' Packge Checks

usethis::use_github_action_check_standard()
usethis::use_travis()


#'//////////////////////////////////////

#' ~ 3 ~
#' Build

devtools::check_man()
devtools::check()