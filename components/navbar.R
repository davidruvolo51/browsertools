#'//////////////////////////////////////////////////////////////////////////////
#' FILE: navbar.R
#' AUTHOR: David Ruvolo
#' CREATED: 2019-12-10
#' MODIFIED: 2019-12-10
#' PURPOSE: ui component for creating a navigation bar
#' STATUS: in.progress
#' PACKAGES: shiny
#' COMMENTS: 
#' 
#'//////////////////////////////////////////////////////////////////////////////

# DEFINE HELPER FUNCTIONS AS NESTED LIST
navbar_helpers <- list()

# ~ 0 ~
# CREATE BRAND LOGO OR LINK
# define a function that creates the branding element this is either a title,
# link, or link + title. 
navbar_helpers$build_brandlink <- function(title, href = NULL, img = NULL){

    # create brand element - either text or link
    if(!is.null(titleLink)){
        title <- tags$a(class="navbar-brand brand-link", href= href)
    } else {
        title <- tags$p(class="navbar-brand brand-text")
    }

    # add text
    title$children <- tags$span(title)

    # should an image be rendered?
    if(!is.null(img)){
        img <- tags$img(class="navbar-brand-img", src=img$src, alt=img$alt)
        title$children <- list(title$children, img)
    }

    # return title
    return(title)

}

# ~ 1 ~
# BUILD_MENU
# create a function that renders navigation menu using user defined linnks and labels
# both items are required and should be supplied as arrays of equal lengths
navbar_helpers$build_menu <- function(links = NULL, labels = NULL){
    
    # build list items
    li <- lapply(1:length(links), function(index){
        li <- tags$li(class="menu-item")
        li$children <- tags$a(class="menu-link", href=links[index], labels[index])
        return(li)
    })

    # return as list
    tags$ul(class="menu", li)
}

# ~ 2 ~
# BUILD_MENU TOGGLE
# create a function that returns a menu toggle
navbar_helpers$build_toggle <- function(id, label = FALSE){
    btn <- tags$button(id="menu-toggle", class="action-button shiny-bound-input")
    btn$children <- HTML()
}

# ~  ~
# NAVBAR
# create function that wraps helper functions to create a navigation bar
navbar <- function(title, href = NULL, img = NULL, links = NULL, labels = NULL){

    # render subelements
    brand <- navbar_helpers$build_brandlink(title = title, href = href, img = img)
    menu <- navbar_helpers$build_menu(links = links, labels = labels)

}