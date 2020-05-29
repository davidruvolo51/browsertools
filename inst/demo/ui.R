#'////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-05-25
#' MODIFIED: 2020-05-28
#' PURPOSE: browsertools demo
#' STATUS: in.progress
#' PACKAGES: shiny, browsertools
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# pkgs
suppressPackageStartupMessages(library(shiny))

# define example app
sample_code <- "
# pkg
library(shiny)

# ui
ui <- tagList(
    browsertools::use_browsertools(),
    h1('Hello, world!')
)

# server
server <- function(input, output) {

    # use debug
    browsertools::debug()
}

# app
shinyApp(ui, server)"

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


# ui
ui <- tagList(
    browsertools::use_browsertools(),
    singleton(
        tags$head(
            tags$meta(charset = "utf-8"),
            tags$meta(
                `http-quiv` = "x-ua-compatible",
                content = "ie=edge"
            ),
            tags$meta(
                name = "viewport",
                content = "width=device-width, initial-scale=1"
            ),
            tags$meta(
                name = "description",
                content = "A demonstration of the browsertools package"
            ),
            tags$meta(property = "og:title", content  = "browsertools demo"),
            tags$meta(
                property = "og:description",
                content = "A demonstration of the browsertools package"
            ),
            tags$meta(property = "og:url", content = "[url to your app]"),
            tags$meta(propery = "twitter:card", content = "summary"),
            tags$link(rel = "stylesheet", href = "demo.min.css"),
            tags$style(
                HTML(
                    ".text {
                        font-weight: bold;
                        color: #353535;
                        font-size: 24pt;
                     }"
                )
            ),
            tags$title("browsertools | Demo")
        )
    ),
    tags$header(
        class = "hero",
        tags$div(
            class = "hero-content",
            tags$img(src = "browsertools.svg", id = "logo"),
            tags$h1("browsertools"),
            tags$h2("An Overview and Examples")
        )
    ),
    tags$main(
        id = "main",
        class = "main",
        tags$section(
            id = "getting-started",
            class = "section",
            `aria-labelledby` = "getting-started-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    tags$h2(id = "getting-started-title", "Getting Started"),
                    class = "flex-child browsertools-info",
                    tags$p(
                        "The", pkgname(), "package contains a series of",
                        "functions for manipulating the Shiny UI from within",
                        "the shiny server. This demo app will provides",
                        "examples for using this package."
                    ),
                    tags$p(
                        "In your shiny app, call the function",
                        funcname("use_browsertools"), ".", "You can also use",
                        "the function", funcname("debug"), "in the server",
                        "while you are developing your app. This function",
                        "displays JavaScript errors in the R console or in",
                        "the terminal."
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$pre(tags$code(sample_code))
                )
            )
        ),
        tags$section(
            id = "modifying-css-classes",
            class = "section",
            `aria-labelledby` = "modifying-css-classes-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "modifying-css-classes-title",
                        "Modifying CSS Classes"
                    ),
                    tags$p(
                        "You can modify the css classes of an HTML element",
                        "or elements using a few functions available in this",
                        "package. Use", funcname("add_css"), "to add a class",
                        "to an element and use", funcname("remove_css"), "to",
                        "remove a class by name.", funcname("toggle_css"),
                        "will toggle the class regardless."
                    ),
                    tags$p(
                        "These functions have the same arguments.",
                        "Use", argname("elem"), "to select one or more",
                        "elements using an ID ('#myelem'), class ('.myelems')",
                        "tag ('h2'), or another selector to manipulate a",
                        argname("css"), "name."
                    ),
                    tags$button(
                        id = "add-css",
                        class = "shiny-bound-input action-button b",
                        "Add CSS"
                    ),
                    tags$button(
                        id = "remove-css",
                        class = "text-example",
                        class = "shiny-bound-input action-button b",
                        "Remove CSS"
                    ),
                    tags$button(
                        id = "toggle-css",
                        class = "shiny-bound-input action-button b",
                        "Toggle CSS"
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$h3(class = "visually-hidden", "Example"),
                    tags$p(
                        id = "css-text-example",
                        class = "text-example",
                        "Click the buttons to change the style of",
                        "this sentence."
                    )
                )
            )
        ),
        tags$section(
            id = "hiding-and-showing-elements",
            class = "section",
            `aria-labelledby` = "hiding-and-showing-elements-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "hiding-and-showing-elements-title",
                        "Hiding and Showing Elements"
                    ),
                    tags$p(
                        "You can use the functions", funcname("hide_elem"),
                        "and", funcname("show_elem"), "to modify the",
                        "visibility of an element. Use the function",
                        funcname("hidden"), "in the shiny UI to hide elements",
                        "when the app loads."
                    ),
                    tags$p(
                        "Use the buttons below to view the examples."
                    ),
                    tags$button(
                        id = "hide-elem",
                        class = "shiny-bound-input action-button b",
                        "Hide"
                    ),
                    tags$button(
                        id = "show-elem",
                        class = "shiny-bound-input action-button b",
                        "Show"
                    ),
                    tags$button(
                        id = "reveal-elem",
                        class = "shiny-bound-input action-button b",
                        "Reveal Element"
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$h3(class = "visually-hidden", "Example"),
                    tags$p(
                        id = "hide-show-text-example",
                        class = "text-example",
                        "Click the buttons 'hide' and 'show' to the",
                        "visibility of this sentence."
                    ),
                    browsertools::hidden(
                        tags$p(
                            id = "reveal-text-example",
                            "This sentence is hidden by default using the",
                            "function", funcname("hidden"), ". Use",
                            funcname("show_elem"), "to reveal an element."
                        )
                    )
                )
            )
        ),
        tags$section(
            id = "removing-and-adding-elements",
            class = "section",
            `aria-labelledby` = "removing-and-adding-elements-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "removing-and-adding-elements-title",
                        "Removing and Adding Elements"
                    ),
                    tags$p(
                        "There may be instances where you would want to",
                        "remove an element from the UI or create a new",
                        "element.", pkgname(), "offers a couple functions",
                        "for handling this. Use", funcname("remove_elem"),
                        "to removing an element from the shiny UI. You can",
                        "add new elements using",
                        funcname("inner_adjacent_html")
                    ),
                    tags$p(
                        "Using the buttons below, remove the sentence on the",
                        "right and create a new one in it's place."
                    ),
                    tags$button(
                        id = "remove-add-elem",
                        class = "shiny-bound-input action-button b",
                        "Remove and Add Element"
                    )
                ),
                tags$div(
                    id = "remove-element-example-container",
                    class = "flex-child browsertools-results",
                    tags$p(
                        id = "remove-element-text-example",
                        "Click the 'remove element' button to remove this",
                        "sentence."
                    )
                )
            )
        ),
        tags$section(
            id = "changing-the-content-of-an-element",
            class = "section",
            `aria-labelledby` = "changing-the-content-of-an-element-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "changing-the-content-of-an-element-title",
                        "Changing the content of an element"
                    ),
                    tags$p(
                        "Instead of adding and removing an element, you may",
                        "want to change the content of a element. You can use",
                        "the function", funcname("inner_text"), "to change",
                        "the content of an element (as raw text) or you can",
                        "modify an element's content using",
                        funcname("inner_html"), "to change or add an HTML",
                        "element(s)"
                    ),
                    tags$button(
                        id = "change-text",
                        class = "shiny-bound-input action-button b",
                        "Change Text"
                    ),
                    tags$button(
                        id = "change-html",
                        class = "shiny-bound-input action-button b",
                        "Change HTML"
                    ),
                    tags$button(
                        id = "append-html",
                        class = "shiny-bound-input action-button b",
                        "Append HTML"
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$p(
                        id = "change-content-text-example",
                        "Click the buttons to the left to change the content",
                        "of this element."
                    )
                )
            )
        ),
        tags$section(
            id = "modifying-an-elements-attribute",
            class = "section",
            `aria-labelledby` = "modifying-an-elements-attribute-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "modifying-an-elements-attribute-title",
                        "Modifying an Element's Attribute"
                    ),
                    tags$p(
                        "Using the functions",
                        funcname("set_element_attribute"), "and",
                        funcname("remove_element_attribute"), "you can change",
                        "or add an attribute of an element. This may be",
                        "useful if you want to bind data to elements or for",
                        "creating custom interactive elements."
                    ),
                    tags$p(
                        "The buttons below will demonstrate how to create a",
                        "new data attribute."
                    ),
                    tags$button(
                        id = "set-element-attribute",
                        class = "shiny-bound-input action-button b",
                        "Set Attribute"
                    ),
                    tags$button(
                        id = "remove-element-attribute",
                        class = "shiny-bound-input action-button b",
                        "Remove Attribute"
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$code(
                        id = "element-attribute-text-example",
                        '<p id="greeting">Hello!</p>'
                    )
                )
            )
        ),
        tags$section(
            id = "console-messages",
            class = "section",
            `aria-labelledby` = "console-messages-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "console-messages-title",
                        "Sending Messages to the Console"
                    ),
                    tags$p(
                        "Depending on your application, you may want to log",
                        "messages in the brower's console. These messages are",
                        "useful for debugging errors in a producation app.",
                        "There are a several functions available in the",
                        pkgname(), "package"
                    ),
                    tags$ul(
                        tags$li(
                            funcname("console_error"), "log an error"
                        ),
                        tags$li(
                            funcname("console_log"), "log a message"
                        ),
                        tags$li(
                            funcname("console_table"), "log a data object"
                        ),
                        tags$li(
                            funcname("console_warn"), "log a warning"
                        )
                    )
                ),
                tags$div(
                    class = "flex-child browerstools-results",
                    tags$p(
                        "Open the browser's console and click the buttons",
                        "on the right."
                    ),
                    tags$button(
                        id = "console-error-example",
                        class = "shiny-bound-input action-button b",
                        "Log Error"
                    ),
                    tags$button(
                        id = "console-log-example",
                        class = "shiny-bound-input action-button b",
                        "Log Message"
                    ),
                    tags$button(
                        id = "console-table-example",
                        class = "shiny-bound-input action-button b",
                        "Log Table"
                    ),
                    tags$button(
                        id = "console-warning-example",
                        class = "shiny-bound-input action-button b",
                        "Log Warning"
                    )
                )
            )
        ),
        tags$section(
            id = "scroll-to",
            `aria-labelledby` = "scroll-to-title",
            class = "section",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "scroll-to-title",
                        "Scrolling to Areas of the Page"
                    ),
                    tags$p(
                        "It is also possible that you may want to",
                        "scroll the page to a specific point. For example,",
                        "a chart, image, a paragraph, etc. The function",
                        funcname("scroll_to"), "can be used to scroll to a",
                        "specific point in the page. You can either enter",
                        "x and y coordinates (starting from the top left) or",
                        "use a selector page (id, class, tag, etc.)."
                    ),
                    tags$p(
                        "Use the buttons on the right to scroll to the top",
                        "of the page or to the section 'Getting Started'."
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$button(
                        id = "scroll-to-top-example",
                        class = "shiny-bound-input action-button b",
                        "Scroll to Top"
                    ),
                    tags$button(
                        id = "scroll-to-section-example",
                        class = "shiny-bound-input action-button b",
                        "Scroll to 'Getting Started'"
                    )
                )
            )
        ),
        tags$section(
            id = "page-refresh",
            class = "section",
            `aria-labelledby` = "page-refresh-title",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2(
                        id = "page-refresh-title",
                        "Refreshing the Page"
                    ),
                    tags$p(
                        "Lastly, the function", funcname("refresh_page"),
                        "will trigger a page refresh."
                    ),
                    tags$button(
                        id = "page-refresh-example",
                        class = "shiny-bound-input action-button b",
                        "Refresh Page"
                    )
                )
            )
        )
    ),
    singleton(
        tags$script(src = "demo.min.js")
    )
)