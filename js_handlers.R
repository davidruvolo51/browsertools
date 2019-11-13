#'//////////////////////////////////////////////////////////////////////////////
#' FILE: function_02_handlers.R
#' AUTHOR: David Ruvolo
#' CREATED: 2019-11-10
#' MODIFIED: 2019-11-12
#' PURPOSE: shiny handlers
#' STATUS: in.progress
#' PACKAGES: shiny
#' COMMENTS: NA
#'//////////////////////////////////////////////////////////////////////////////
# create object
js <- list()

# build wrapper for handler: addCSS
js$addCSS <- function(elem, css, session){
    session$sendCustomMessage("addCSS", list(elem, css))
}

# build wrapper for handler: consoleLog
js$consoleLog <- function(value, asDir = TRUE, session){
    session$sendCustomMessage("consoleLog", list(value, asDir))
}

# build wrapper for handler: toggleElem
js$hideElem <- function(id, session){
    session$sendCustomMessage("hideElem", list(id))
}

# build wrapper for handler: innerHTML
js$innerHTML <- function(elem, string, session){
    session$sendCustomMessage("innerHTML", list(elem, string))
}
    
# build wrapper for handler: refreshPage
js$refreshPage <- function(session){
    session$sendCustomMessage("refreshPage", "")
}
    
# build wrapper for handler: removeCSS
js$removeCSS <- function(elem, css, session){
    session$sendCustomMessage("removeCSS", list(elem, css))
}

# build wrapper for handler: toggleElem
js$showElem <- function(id, session){
    session$sendCustomMessage("showElem", list(id))
}
    
# build wrapper for handler: setElementAttribute
js$setElementAttribute <- function(elem, attr, value, session){
    session$sendCustomMessage("setElementAttribute", list(elem, attr, value))
}

# build wrapper for handler: toggleCSS
js$toggleCSS <- function(elem, css, session){
    session$sendCustomMessage("toggleCSS", list(elem, css))
}