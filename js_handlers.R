#'//////////////////////////////////////////////////////////////////////////////
#' FILE: function_02_handlers.R
#' AUTHOR: David Ruvolo
#' CREATED: 2019-11-10
#' MODIFIED: 2019-12-11
#' PURPOSE: shiny handlers
#' STATUS: working
#' PACKAGES: shiny
#' COMMENTS: NA
#'//////////////////////////////////////////////////////////////////////////////

# Create JS Object
# "modularize" shiny session calls in a nested object
js <- list()


# addCSS
# define a function that adds a css class name to a given element
# this function takes the following attributes
#   - elem: a selector to be passed to `querySelector`
#   - css: the class name to add to the element
js$addCSS <- function(elem, css){
    session$sendCustomMessage("addCSS", list(elem, css))
}

# build wrapper for handler: clear inputs
js$clearInput <- function(elem){
    session$sendCustomMessage("clearInput", list(elem))
}

# build wrapper for handler: consoleLog
js$consoleLog <- function(value, asDir = TRUE){
    session$sendCustomMessage("consoleLog", list(value, asDir))
}

# build wrapper for handler: toggleElem
js$hideElem <- function(id){
    session$sendCustomMessage("hideElem", list(id))
}

# build wrapper for handler: innerHTML
js$innerHTML <- function(elem, string, delay = NULL){
    session$sendCustomMessage("innerHTML", list(elem, string, delay))
}
    
# build wrapper for handler: refreshPage
js$refreshPage <- function(){
    session$sendCustomMessage("refreshPage", "")
}
    
# build wrapper for handler: removeCSS
js$removeCSS <- function(elem, css){
    session$sendCustomMessage("removeCSS", list(elem, css))
}

# build wrapper for handler: scrollToTop
js$scrollToTop <- function(session){
    session$sendCustomMessage("scrollToTop", "")
}

# build wrapper for handler: toggleElem
js$showElem <- function(id){
    session$sendCustomMessage("showElem", list(id))
}
    
# build wrapper for handler: setElementAttribute
js$setElementAttribute <- function(elem, attr, value){
    session$sendCustomMessage("setElementAttribute", list(elem, attr, value))
}

# build wrapper for handler: toggleCSS
js$toggleCSS <- function(elem, css){
    session$sendCustomMessage("toggleCSS", list(elem, css))
}