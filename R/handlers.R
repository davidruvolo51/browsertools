#' \code{get_shiny_session}
#' A function for finding the shiny session
#' @keywords browsertools, session
get_shiny_session <- function(...) {
    return(shiny::getDefaultReactiveDomain())
}

#' \code{use_browsertools}
#' Function that loads all assets into your shiny app
#' @return Function that loads all assets into your shiny app
#' @keywords browsertools, use
#' @example
#' browsertools::use_browsertools()
#' @export
use_browsertools <- function() {
    htmltools::htmlDependency(
        name = "browsertools",
        version = "0.1.0",
        src = "assets/js/",
        package = "browsertools",
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
#' @keywords browsertools, css, add
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
#' @keywords browsertools, input, clear
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
#' @param x an object to display in the browser
#' @return Outputs an object to the browser's console
#' @keywords browsertools, debugging, console
#' @example
#' console_log(x = "Hello, world!")
#' @export
console_log <- function(x) {
    session <- get_shiny_session()
    session$sendCustomMessage("console_log", x)
}

#' \code{console_table}
#'
#' Outputs an data object to the browser's console in table format
#' @param x an object to display in the browser (data.frame, etc.)
#' @return Outputs an object to the browser's console
#' @keywords browsertools, debugging, console
#' @example
#' console_table(x = iris)
#' @export
console_table <- function(x) {
    session <- get_shiny_session()
    session$sendCustomMessage("console_table", x)
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
#' @keywords browsertools, css, show
#' @examples
#' hide_elem(elem = "#mydiv")
#' hide_elem(elem = "#mydiv", css = "show-div")
#' @export
hide_elem <- function(elem, css = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("hide_elem", list(elem, css))
}

#' \code{inner_html}
#'
#' Update the content of an element by id or class name
#' @return Update the content of an element by id or class name
#' @param elem the ID or class name of an html element
#' @param string a string to display in the element
#' @param delay an optional arg to add a brief pause
#'              before sending the content to the html element.
#'              Ideal for content that is rendered by the server.
#'              Input is time in milliseconds.
#' @keywords browsertools, inner, html
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
#' @keywords browsertools, page, refresh
#' @example
#' refresh_page()
#' @export
refresh_page <- function() {
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
#' @keywords browsertools, css, remove
#' @examples
#' remove_css(elem = "#mydiv", css = "some-css-class")
#' @export
remove_css <- function(elem, css) {
    session <- get_shiny_session()
    session$sendCustomMessage("remove_css", list(elem, css))
}

#' \code{remove_element}
#'
#' Removes an html element from the DOM
#' @param elem an ID of the element to remove
#' @return Removes an html element from the DOM
#' @keywords browsertools, remove, element
#' @example
#' remove_element(elem = "#mydiv")
#' @export
remove_element <- function(elem) {
    session <- get_shiny_session()
    session$sendCustomMessage("remove_element", elem)
}

#' \code{remove_element_attribute}
#'
#' Removes an html attribute from an element
#' @param elem an ID of the html element to be modified
#' @param attr the name of the attribute to remove
#' @return Remove an attribute from an html element
#' @keywords browsertools, remove, attribute
#' @example
#' remove_element_attribute(elem = "#mydiv", attr = "class")
#' @export
remove_element_attribute <- function(elem, attr) {
    session <- get_shiny_session()
    session$sendCustomMessage("remove_element_attribute", list(elem, attr))
}

#' \code{reset_input_groups}
#' 
#' Resets the values of all input groups by ID or type
#' @param elem an ID of an input group to be reset (optional)
#' @param type the name of input type ("all", "radio", "checkbox") (optional)
#' @param default_val a logical value to use as the default or a name
#'                  of an html attribute to use a the default value.
#'                  This is used in \code{elem.checked = ...}
#'                  (optional)
#' @return Reset input group values to default
#' @keywords browsertools, reset, inputs, input groups
#' @example
#' reset_input_groups(elem = "myinput")
#' reset_input_groups(elem = "myinput", default_val = "true")
#' reset_input_groups(type = "radio", default_val = "data-default-vals")
#' @export
reset_input_groups <- function(elem, type = "all", default_val = FALSE) {
    types <- c("all", "radio", "checkbox")
    if (isTRUE(type)) {
        if (type %in% types) {
            stop("Error in 'reset_input_groups': type not found, use ", types)
        }
        if (length(type) > 1) {
            stop("Name only one input type. Use \"type = 'all'\" to select all inputs")
        }
    }
    session <- get_shiny_session()
    session$sendCustomMessage(
        "reset_input_groups",
        list(
            elem,
            tolower(type),
            tolower(default_val)
        )
    )
} 

#' \code{scroll_to_top}
#'
#' Moves the current viewport to the top of the page
#' @return Adds a css class(es) to an element using id or classname.
#' @keywords browsertools, scroll
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
#' @keywords browsertools, attribute, value
#' @examples
#' set_element_attribute(elem = "#mydiv", attr = "data-value", value = "12345")
#' @export
set_element_attribute <- function(elem, attr, value) {
    session <- get_shiny_session()
    session$sendCustomMessage("set_element_attribute", list(elem, attr, value))
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
#' @keywords browsertools, css, show
#' @examples
#' show_elem(elem = "#mydiv")
#' show_elem(elem = "#mydiv", css = "show-div")
#' @export
show_elem <- function(elem, css = NULL) {
    session <- get_shiny_session()
    session$sendCustomMessage("show_elem", list(elem, css))
}

#' \code{toggle_css}
#'
#' Toggles a css state of an html element
#' @return Toggles a css state of an html element
#' @param elem the id or class name of an html element
#' @param css a string containing the class to remove from
#'            an html element
#' @keywords browsertools, attribute, value
#' @examples
#' toggle_css(elem = "#mydiv", css = "mytheme")
#' @export
toggle_css <- function(elem, css) {
    session <- get_shiny_session()
    session$sendCustomMessage("toggle_css", list(elem, css))
}