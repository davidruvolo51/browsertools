#' \code{add_css}
#'
#' Adds a css class(es) to an element using id or classname.
#' @param elem the id or class name of an html element
#' @param css a string containing the class(es) to add to
#'            an html element
#' @return Adds a css class(es) to an element using id or classname.
#' @keywords browsertools, css, add
#' @examples
#' add_css(elem = "#mydiv", css = "some-css-class")
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/add}
#' @export
add_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("add_css", list(elem = elem, css = css))
}

#' \code{alert}
#'
#' Send an alert dialog to the browser
#' @return Send an alert dialog to the browser
#' @param message a message to send
#' @keywords browsertools, alert
#' @examples
#' alert("hello world")
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Window/alert}
#' @export
alert <- function(message) {

    # validate
    if (is.null(message)) stop("argument 'message' cannot be empty")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("alert", list(message = message))
}

#' \code{console_error}
#'
#' Sends an error message to the brower's console
#' @param message an error to display
#' @return Sends an error message to the browser's console
#' @keywords browsertools, debugging, console
#' @examples
#' console_error(message = "Error: 'object' undefined")
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/error}
#' @export
console_error <- function(message) {
    if (is.null(message)) stop("argument 'message' is undefined")
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("console_error", message)
}

#' \code{console_log}
#'
#' Outputs an object to the browser's console
#' @param message a message to display
#' @param expand an option to expand arrays and objects (default: false)
#' @return Outputs an object to the browser's console
#' @keywords browsertools, debugging, console
#' @examples
#' console_log(x = "Hello, world!")
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/log}
#' @export
console_log <- function(message, expand = FALSE) {

    # validate
    if (is.null(message)) stop("argument 'message' is undefined")
    if (!is.logical(expand)) stop("argument 'expand' must be a logical value")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "console_log",
        list(message = message, expand = expand)
    )
}

#' \code{console_table}
#'
#' Outputs an data object to the browser's console in table format
#' @param data an object to display in the browser (data.frame, etc.)
#' @param to_json an optional argument that transforms input data to json
#' @return Outputs an object to the browser's console
#' @keywords browsertools, debugging, console
#' @examples
#' console_table(data = iris)
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/table}
#' @export
console_table <- function(data, to_json = TRUE) {

    # validate
    if (is.null(data)) stop("argument 'data' is undefined")
    if (to_json) data <- as_js_object(data)

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("console_table", data)
}

#' \code{console_warn}
#'
#' Outputs a warning message to the console
#' @return Outputs a warning message to the console
#' @param message a message to display
#' @keywords browsertools, console, warn
#' @examples
#' console_warn(message = "this is a warning message")
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/warn}
#' @export
console_warn <- function(message) {
    if (is.null(message)) stop("argument 'message' is undefined")
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("console_warn", message)
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
#' @importFrom shiny getDefaultReactiveDomain
#' @export
hide_elem <- function(elem, css = "browsertools-hidden") {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("hide_elem", list(elem = elem, css = css))
}

#' \code{inner_html}
#'
#' Update the content of an element by id or class name
#' @return Update the content of an element by id or class name
#' @param elem the ID or class name of an html element
#' @param string a string or html string to display in the element
#' @param append an option that appends value of string or replaces it
#' @param delay an optional arg to add a brief pause
#'              before sending the content to the html element.
#'              Ideal for content that is rendered by the server.
#'              Input is time in milliseconds.
#' @keywords browsertools, innerhtml
#' @examples
#' inner_html(elem = "#mydiv", string = "hello, world", delay = 500)
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML}
#' @export
inner_html <- function(elem, string, append = FALSE, delay = NULL) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(string)) stop("argument 'string' is undefined")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "inner_html",
        list(elem = elem, string = string, append = append, delay = delay)
    )
}

#' \code{inner_text}
#'
#' Modify the text of an element
#' @return Modify the text of an element
#' @param elem an element to select (e.g., ID, class, tag, etc.)
#' @param string a string used to insert into the element
#' @param append an option that appends value of string or replaces it
#' @param delay an optional arg that adds a brief pause before
#'              sending the content to the html element. Ideal
#'              for content that is rendered server-side. Input
#'              time is in milliseconds.
#' @keywords browsertools, innertext
#' @examples
#' inner_text(elem = "#mydiv", string = "Hello, world", delay = 200)
#' inner_text(elem = "#mydiv", string = "Hello, world", append = TRUE)
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText}
#' @export
inner_text <- function(elem, string, append = FALSE, delay = NULL) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(string)) stop("argument 'string' is undefined")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "inner_text",
        list(elem = elem, string = string, append = append, delay = delay)
    )
}

#' \code{insert_adjacent_html}
#'
#' Create a new html element using shiny tags as a child of an element
#' @return Create a new html element using shiny tags as a child of an element
#' @param id an id of the parent element to render new elements into
#' @param html an html tag or list object containing elements to render
#' @param position a position relative to the html element
#'             (i.e., \code{beforebegin}, \code{afterbegin}, \code{beforeend},
#'             or \code{afterend})
#' @keywords browsertools, html, insertHTML
#' @importFrom shiny getDefaultReactiveDomain
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML}
#' @export
insert_adjacent_html <- function(id, html, position = "beforeend") {

    # validate
    if (is.null(id)) stop("argument 'id' error is undefined")
    if (is.null(html)) stop("argument 'html' error is undefined")
    if (is.null(position)) stop("argument 'position' error is undefined")
    session <- getDefaultReactiveDomain()

    # validate argument "position"
    defaults <- c("beforebegin", "afterbegin", "beforeend", "afterend")
    if (!position %in% defaults) {
        stop("input for 'position' is not valid")
    }

    # send message
    session$sendCustomMessage(
        "insert_adjacent_html",
        list(id = id, html = as.character(html), position = position)
    )
}

#' \code{refresh_page}
#'
#' Trigger a page refresh
#' @return Trigger a page refres
#' @keywords browsertools, page, refresh
#' @examples
#' refresh_page()
#' @importFrom shiny getDefaultReactiveDomain
#' @export
refresh_page <- function() {
    session <- getDefaultReactiveDomain()
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
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/remove}
#' @importFrom shiny getDefaultReactiveDomain
#' @export
remove_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("remove_css", list(elem = elem, css = css))
}

#' \code{remove_element}
#'
#' Removes an html element from the DOM
#' @param elem an ID of the element to remove
#' @return Removes an html element from the DOM
#' @keywords browsertools, remove, element
#' @examples
#' remove_element(elem = "#mydiv")
#' @importFrom shiny getDefaultReactiveDomain
#' @export
remove_element <- function(elem) {
    if (is.null(elem)) stop("argument 'elem' is undefined")
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("remove_element", list(elem = elem))
}

#' \code{remove_element_attribute}
#'
#' Removes an html attribute from an element
#' @param elem an ID of the html element to be modified
#' @param attr the name of the attribute to remove
#' @return Remove an attribute from an html element
#' @keywords browsertools, remove, attribute
#' @examples
#' remove_element_attribute(elem = "#mydiv", attr = "class")
#' @importFrom shiny getDefaultReactiveDomain
#' @export
remove_element_attribute <- function(elem, attr) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(attr)) stop("argument 'attr' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "remove_element_attribute",
        list(elem = elem, attr = attr)
    )
}

#' \code{scroll_to}
#'
#' Scrolls the window to the top of the page, user defined coordinates, or
#' a specific element. The default behavior of this function is to scroll
#' to the top of the page (x: 0, y: 0). You can also use an element's selector
#' path instead.
#' @return Scrolls the window to the top of the page or a user
#'          defined coordinates
#' @param x amount (in pixels) to scroll along the horizontal axis
#'          starting from the top left (default: 0)
#' @param y amount (in pixels) to scroll along the vertical axis
#'          starting from the top left (default: 0)
#' @param elem a selector path of an element that you would like to scroll
#'          to (i.e., id, class, tag, etc.). Using elem will override any
#'          coordinates.
#' @keywords browsertools, scroll
#' @examples
#' scroll_to()
#' scroll_to(y = 250)
#' scroll_to(elem = "#mydiv")
#' @importFrom shiny getDefaultReactiveDomain
#' @export
scroll_to <- function(x = 0, y = 0, elem = NULL) {

    # validate
    if (!is.numeric(x)) stop("argument 'x' must be numeric")
    if (!is.numeric(y)) stop("argument 'y' must be numeric")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("scroll_to", list(x = x, y = y, elem = elem))
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
#' @importFrom shiny getDefaultReactiveDomain
#' @export
set_element_attribute <- function(elem, attr, value) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(attr)) stop("argument 'attr' is undefined")
    if (is.null(value)) stop("argument 'value' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "set_element_attribute",
        list(elem = elem, attr = attr, value = value)
    )
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
#' @importFrom shiny getDefaultReactiveDomain
#' @export
show_elem <- function(elem, css = "browsertools-hidden") {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("show_elem", list(elem = elem, css = css))
}

#' \code{toggle_css}
#'
#' Toggles a css state of an html element
#' @return Toggles a css state of an html element
#' @param elem the id or class name of an html element
#' @param css a string containing the class to remove from an html element
#' @keywords browsertools toggle css
#' @examples
#' toggle_css(elem = "#mydiv", css = "mytheme")
#' @references \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/toggle}
#' @importFrom shiny getDefaultReactiveDomain
#' @export
toggle_css <- function(elem, css) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("toggle_css", list(elem = elem, css = css))
}


#' \code{toggle_elem}
#'
#' Toggle the visibility of an html element
#' @return Toggle the visibility of an html element
#' @param elem the id or class name of an html element
#' @param css a string containing the class to remove from an html element
#'          (default: browsertools-hidden; package default)
#' @keywords browsertools toggle element
#' @examples
#' toggle_elem(elem = "#mydiv")
#' @importFrom shiny getDefaultReactiveDomain
#' @export
toggle_elem <- function(elem, css = "browsertools-hidden") {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("toggle_elem", list(elem = elem, css = css))
}