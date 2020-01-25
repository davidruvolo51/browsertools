#' \code{get_shiny_session}
#' A function for finding the shiny session
#' @keywords shinytools, session
get_shiny_session <- function(...) {
    return(shiny::getDefaultReactiveDomain())
}

#' \code{use_shinytools}
#' Function that loads all assets into your shiny app
#' @return Function that loads all assets into your shiny app
#' @keywords shinytools, use
#' @example
#' shinytools::use_shinytools()
#' @export
use_shinytools <- function() {
    htmltools::htmlDependency(
        name = "shinytools",
        version = "0.1.0",
        src = "assets/js/",
        package = "shinytools",
        script = "index.js",
        all_files = FALSE
    )
}

#' \code{add_css}
#'
#' Adds a css class(es) to an element using id or classname.
#' @param elem the id or class name of an html element
#' @param css a string containing the class(es) to add to
#'            an html element
#' @return Adds a css class(es) to an element using id or classname.
#' @keywords shinytools, css, add
#' @example
#' add_css(elem = "#mydiv", css = "some-css-class")
#' @export
add_css <- function(elem, css) {
    session <- get_shiny_session()
    session$sendCustomMessage("add_css", list(elem, css))
}

#' \code{clear_input}
#'
#' Resets an html inputs value
#' @param elem the id or class name of an html element
#' @return Resets an html inputs value
#' @keywords shinytools, input, clear
#' @example
#' clear_input(elem = "#mydiv")
#' @export
clear_input <- function(elem, value = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("clear_input", list(elem, value))
}

#' \code{console_log}
#'
#' Outputs an object to the browser's console
#' @param x an object to display in the browser (data.frame, etc.)
#' @param asDir a boolean when \code{TRUE} will display the object in the
#'              console using \code{console.dir} instead of .log.
#'              (default = \code{TRUE})
#' @return Outputs an object to the browser's console
#' @keywords shinytools, debugging, console
#' @example
#' console_log(x = iris)
#' @export
console_log <- function(x, asDir = TRUE) {
    session <- get_shiny_session()
    session$sendCustomMessage("console_log", list(x, asDir))
}

#' \code{inner_html}
#'
#' Update the content of an element by id or class name
#' @return Update the content of an element by id or class name
#' @param elem the id or class name of an html element
#' @param string a string to display in the element
#' @param delay an optional arg to add a brief pause
#'              before sending the content to the html element.
#'              Ideal for content that is rendered by the server.
#'              Input is time in milliseconds.
#' @keywords shinytools, inner, html
#' @example
#' inner_html(elem = "#mydiv", string = "hello, world", delay = 500)
#' @export
inner_html <- function(elem, string, delay = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("inner_html", list(elem, string, delay))
}

#' \code{refresh_page}
#'
#' Trigger a page refresh
#' @return Trigger a page refres
#' @keywords shinytools, page, refresh
#' @example
#' refresh_page()
#' @export
refresh_page <- function(...) {
    session <- get_shiny_session()
    session$sendCustomMessage("refresh_page", "")
}
    
#' \code{remove_css}
#'
#' Removes a css class(es) to an element using id or classname.
#' @param elem the id or class name of an html element
#' @param css a string containing the class(es) to remove from
#'            an html element
#' @return Removes a css class(es) to an element using id or classname.
#' @keywords shinytools, css, remove
#' @examples
#' remove_css(elem = "#mydiv", css = "some-css-class")
#' @export
remove_css <- function(elem, css) {
    session <- get_shiny_session()
    session$sendCustomMessage("remove_css", list(elem, css))
}

#' \code{scroll_to_top}
#'
#' Moves the current viewport to the top of the page
#' @return Adds a css class(es) to an element using id or classname.
#' @keywords shinytools, scroll
#' @examples
#' scroll_to_top()
#' @export
scroll_to_top <- function(...) {
    session <- get_shiny_session()
    session$sendCustomMessage("scroll_to_top", "")
}

#' \code{set_element_attribute}
#'
#' Set an attribute of an html element
#' @return Set an attribute of an html element
#' @param elem the id or class name of an html element
#' @param attr the name of the attribute to update
#' @param value the value to add to the attribute
#' @keywords shinytools, attribute, value
#' @examples
#' set_element_attribute(elem = "#mydiv", attr = "data-value", value = "12345")
#' @export
set_element_attribute <- function(elem, attr, value) {
    session <- get_shiny_session()
    session$sendCustomMessage("set_element_attribute", list(elem, attr, value))
}

#' \code{toggle_css}
#'
#' Toggles a css state of an html element
#' @return Toggles a css state of an html element
#' @param elem the id or class name of an html element
#' @param css a string containing the class to remove from
#'            an html element
#' @keywords shinytools, attribute, value
#' @examples
#' toggle_css(elem = "#mydiv", css = "mytheme")
#' @export
toggle_css <- function(elem, css) {
    session <- get_shiny_session()
    session$sendCustomMessage("toggle_css", list(elem, css))
}

#' \code{show_elem}
#'
#' Shows an html element by id or class name. This function, by defauly,
#' removes the class \code{hidden} from the desired element and updates
#' aria attriute \code{hidden}. In your css file, create a corresponding
#' selector called \code{hidden} and define the show styles. This allows you
#' to add delays and apply other transformations.
#'
#' @param elem the id or class name of an html elem
#' @param css a string containing the class to remove from an html element
#'              (default class is \code{hidden})
#' @keywords shinytools, css, show
#' @examples
#' show_elem(elem = "#mydiv")
#' show_elem(elem = "#mydiv", css = "show-div")
#' @export
show_elem <- function(elem, css = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("show_elem", list(elem, css))
}

#' \code{hide_elem}
#'
#' Hides an html element by id or class name. This function, by defauly,
#' adds the class \code{hidden} from the desired element and updates
#' aria attriute \code{hidden}. In your css file, create a corresponding
#' selector called \code{hidden} and define the hide styles. This allows you
#' to add delays and apply other transformations.
#'
#' @param elem the id or class name of an html elem
#' @param css a string containing the class to remove from an html element
#'              (default class is \code{hidden})
#' @keywords shinytools, css, show
#' @examples
#' hide_elem(elem = "#mydiv")
#' hide_elem(elem = "#mydiv", css = "show-div")
#' @export
hide_elem <- function(elem, css = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("hide_elem", list(elem, css))
}