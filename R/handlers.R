#' \code{add_css}
#'
#' Adds a css class(es) to an element using id or classname.
#' @param elem the id or class name of an html element
#' @param css a string containing the class(es) to add to
#'            an html element
#' @return Adds a css class(es) to an element using id or classname.
#' @keywords browsertools, css, add
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'        tags$style(
#'           ".blue-text {
#'             color: blue;
#'           }"
#'        )
#'     ),
#'     tags$main(
#'        tags$h2("Add CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          "Click the button below to change the text color to blue"
#'        ),
#'        tags$button(
#'           id = "addCSS",
#'           class = "shiny-bound-input action-button",
#'           "Add CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$addCSS, {
#'        browsertools::add_css(
#'          elem = "#my-text-example",
#'          css = "blue-text"
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/add}
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
#' @param message a message to send
#' @return Send an alert dialog to the browser
#' @keywords browsertools, alert
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display an alert"),
#'     tags$p("Click the button below to display an alert."),
#'     tags$button(
#'        id = "alert",
#'        class = "shiny-bound-input action-button",
#'        "Display Alert"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$alert, {
#'         browsertools::alert(
#'             message = "This is an alert"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Window/alert}
#' @importFrom shiny getDefaultReactiveDomain
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
#' @keywords browsertools debugging console
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display an Error Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendError",
#'        class = "shiny-bound-input action-button",
#'        "Send Error"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendError, {
#'         browsertools::console_error(
#'             message = "This is an error message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/error}
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
#' @keywords browsertools debugging console
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendMessage",
#'        class = "shiny-bound-input action-button",
#'        "Send Message"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendMessage, {
#'         browsertools::console_log(
#'             message = "This is a message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/log}
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
#' @keywords browsertools debugging console
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tagList(
#'      browsertools::use_browsertools(),
#'      tags$p("Open the browser's dev console")
#'  )
#'  server <- function(input, output, session) {
#'      n <- 10
#'      df <- data.frame(
#'          group = sample(letters, n),
#'          x = rnorm(n),
#'          y = rnorm(n),
#'          z = rnorm(n)
#'      )
#'      browsertools::console_table(data = df)
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/table}
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
#' @keywords browsertools console warn
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display Warning Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendWarning",
#'        class = "shiny-bound-input action-button",
#'        "Send Warning"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendWarning, {
#'         browsertools::console_warn(
#'             message = "This is a warning message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'      \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/warn}
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
#' @keywords browsertools css show
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Hide Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to hide the message below."
#'           ),
#'           tags$button(
#'               id = "hideElement",
#'               class = "shiny-bound-input action-button",
#'               "Hide Element"
#'           ),
#'           tags$p(
#'               id = "myMessage",
#'               "Hide this message!"
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$hideElement, {
#'           browsertools::hide_elem(
#'               elem = "#myMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' @keywords browsertools innerhtml
#' @examples
#' if (interactive()) {
#'   inner_html(elem = "#mydiv", string = "hello, world", delay = 500)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references 
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML}
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
#' @keywords browsertools innertext
#' @examples
#' if (interactive()) {
#'   inner_text(elem = "#mydiv", string = "Hello, world", delay = 200)
#'   inner_text(elem = "#mydiv", string = "Hello, world", append = TRUE)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText}
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
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$main(
#'       id = "main",
#'       tags$h1("Inner Adjacent HTML Example")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'   insert_adjacent_html(
#'     id = "main",
#'     html = tagList(
#'         tags$h2("Hello, world!"),
#'         tags$p("How are you doing today?")
#'     ),
#'     position = "afterbegin"
#'   )
#' }
#' }
#' @keywords browsertools html insertHTML
#' @importFrom shiny getDefaultReactiveDomain
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML}
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
#' @keywords browsertools page refresh
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'      browsertools::refresh_page(),
#'      tags$h2("Refresh App Example"),
#'      tags$p("Click the button to refresh the app"),
#'      tags$button(
#'          id = "refreshApp",
#'          class = "shiny-bound-input action-button",
#'          "Resfresh App"
#'      )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$refreshApp, {
#'       browsertools::refresh_page()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' @keywords browsertools css remove
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'        tags$style(
#'           ".blue-text {
#'             color: blue;
#'           }"
#'        )
#'     ),
#'     tags$main(
#'        tags$h2("Remove CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          class = "blue-text",
#'          "Click the button below to remove the blue color from the text"
#'        ),
#'        tags$button(
#'           id = "removeCSS",
#'           class = "shiny-bound-input action-button",
#'           "Remove CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$removeCSS, {
#'        browsertools::remove_css(
#'          elem = "#my-text-example",
#'          css = "blue-text"
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/remove}
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
#' @keywords browsertools remove element
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Remove Element Example"),
#'     tags$p(
#'       id = "textToRemove",
#'       "Click the button below to remove this message."
#'     ),
#'     tags$button(
#'       id = "removeMessage",
#'       class = "shiny-bound-input action-button",
#'       "Remove Message"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeMessage, {
#'       browsertools::remove_element(
#'         elem = "#textToRemove"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'       tags$style(
#'         "[aria-hidden='true'] {
#'              position: absolute;
#'              width: 1px;
#'              height: 1px;
#'              margin: -1px;
#'              clip: rect(0, 0, 0, 0);
#'              clip: rect(0 0 0 0);
#'              overflow: hidden;
#'              white-space: nowrap;
#'         }"
#'       )
#'     ),
#'     tags$h2("Remove Element Attribute Example"),
#'     tags$p(
#'       "Click the button below to remove an attribute of a hidden element"
#'     ),
#'     tags$button(
#'       id = "removeAttr",
#'       class = "shiny-bound-input action-button",
#'       "Remove Attribute"
#'     ),
#'     tags$p(
#'       id = "hidden-text",
#'       `aria-hidden` = "true",
#'       "This is a hidden element"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeAttr, {
#'       browsertools::remove_element_attribute(
#'         elem = "#hidden-text",
#'         attr = "aria-hidden"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' @keywords browsertools scroll
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'         tags$style(
#'             "#spacing{
#'                 height: 1200px;
#'               }"
#'         )
#'     ),
#'     tags$h2("Document Scrolling"),
#'     tags$p("Click the button at the bottom of the page"),
#'     tags$div(
#'         id = "spacing",
#'         `aria-hidden` = "true"
#'     ),
#'     tags$button(
#'        id = "appScroll",
#'        class = "shiny-bound-input action-button",
#'        "Scroll to Top"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$appScroll, {
#'         browsertools::scroll_to()
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
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

#' \code{set_document_title}
#'
#' Set or change the document title
#' @param title a string containing a title of the document
#' @param append if TRUE the title will be added to the current title
#' @keywords browsertools document title
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Setting the Document Title"),
#'     tags$p("Enter a new title for the document"),
#'     tags$input(
#'       id = "titleInput",
#'       class = "shiny-bound-input",
#'       type = "text"
#'     ),
#'     tags$button(
#'        id = "submit",
#'        class = "shiny-bound-input action-button",
#'        "Submit"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$submit, {
#'        browsertools::set_document_title(
#'          title = as.character(input$titleInput)
#'        )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @export
set_document_title <- function(title, append = FALSE) {

    # validate
    if (!is.character(title)) stop("argument 'title' must be a character")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage(
        "set_document_title",
        list(title = title, append = append)
    )
}

#' \code{set_element_attribute}
#'
#' Set an attribute of an html element
#' @param elem the id or class name of an html element
#' @param attr the name of the attribute to update
#' @param value the value to add to the attribute
#' @return Set an attribute of an html element
#' @keywords browsertools attribute value
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'       tags$style(
#'         "[aria-hidden='true'] {
#'              position: absolute;
#'              width: 1px;
#'              height: 1px;
#'              margin: -1px;
#'              clip: rect(0, 0, 0, 0);
#'              clip: rect(0 0 0 0);
#'              overflow: hidden;
#'              white-space: nowrap;
#'         }"
#'       )
#'     ),
#'     tags$h2("Set Element Attribute Example"),
#'     tags$p(
#'       "Click the button below to set an attribute of an element"
#'     ),
#'     tags$button(
#'       id = "setAttr",
#'       class = "shiny-bound-input action-button",
#'       "Set Attribute"
#'     ),
#'     tags$p(
#'       id = "mytext",
#'       `aria-hidden` = "true",
#'       "This element will be modified."
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeAttr, {
#'       browsertools::set_element_attribute(
#'         elem = "#mytext",
#'         attr = "aria-hidden",
#'         value = "true"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' @keywords browsertools css show
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Show Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to show a hidden element."
#'           ),
#'           tags$button(
#'               id = "showElement",
#'               class = "shiny-bound-input action-button",
#'               "Show Element"
#'           ),
#'           browsertools::hidden(
#'               tags$p(
#'                   id = "hiddenMessage",
#'                   "You found the hidden message!"
#'               )
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$showElement, {
#'           browsertools::show_elem(
#'               elem = "#hiddenMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
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
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'        tags$style(
#'           ".blue-text {
#'             color: blue;
#'           }"
#'        )
#'     ),
#'     tags$main(
#'        tags$h2("Toggle CSS Example"),
#'        tags$p(
#'          id = "my-text-example",
#'          "Click the button below to toggle the text color."
#'        ),
#'        tags$button(
#'           id = "toggleCSS",
#'           class = "shiny-bound-input action-button",
#'           "Toggle CSS"
#'        )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'      observeEvent(input$toggleCSS, {
#'        browsertools::toggle_css(
#'          elem = "#my-text-example",
#'          css = "blue-text"
#'        )
#'      })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/toggle}
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
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Toggle Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to toggle the hidden element."
#'           ),
#'           tags$button(
#'               id = "toggleElement",
#'               class = "shiny-bound-input action-button",
#'               "Toggle Element"
#'           ),
#'           browsertools::hidden(
#'               tags$p(
#'                   id = "hiddenMessage",
#'                   "You found the hidden message!"
#'               )
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$toggleElement, {
#'           browsertools::toggle_elem(
#'               elem = "#hiddenMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
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