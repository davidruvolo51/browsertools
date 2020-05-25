#'////////////////////////////////////////////////////////////////////////////
#' FILE: components.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-05-25
#' MODIFIED: 2020-05-25
#' PURPOSE: UI components for demo application
#' STATUS: in.progress
#' PACKAGES: shiny
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# pkgsname
pkgname <- function() {
    return(tags$span(class = "pkgname", "browsertools"))
}

# function name
funcname <- function(name) {
    stopifnot(!is.null(name))
    return(tags$span(class = "funcname", name))
}

# argument name
argname <- function(name) {
    stopifnot(!is.null(name))
    return(tags$span(class = "argname", name))
}


# icons
icon <- list()
icon$chevron <- function(id, class, fill = "#979797", stroke = "none", title = "chevron") {

    # define title
    title <- tag("title", list(title))

    # define path
    path <- tag(
        "path",
        list(
            "d" = "M24.9996511,1 C27.1422663,1 49.966867,20.2167285 48.9681784,21 C46.9554379,21 3.02354748,21 1.03112389,21 C0.0438489124,20.1666667 22.8570359,1 24.9996511,1 Z",
            "stroke" = stroke,
            "fill" = fill
        )
    )

    # define svg
    svg <- tag(
        "svg",
        list(
             "width" = "50px",
             "height" = "22px",
             "viewBox" = "0 0 50 22",
             "version" = "1.1",
             "xmlns" = "http://www.w3.org/2000/svg",
             "xmlns:xlink" = "http://www.w3.org/1999/xlink"
        )
    )

    # add props
    if (length(id) > 0) svg$attribs$id <- id
    if (length(class) > 0) svg$attribs$class <- class

    # append children
    svg$children <- tagList(title, path)

    # return
    return(svg)
}

