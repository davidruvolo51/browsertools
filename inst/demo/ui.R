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
            # tags$meta(
            #    property = "og:image",
            #    content = "path/to/some/image"
            # ),
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
    tags$a(
        class = "visually-hidden",
        href = "#main",
        "to main content"
    ),
    tags$nav(
        class = "navbar",
        tags$ul(
            class = "menu",
            tags$li(
                class = "menu-item",
                tags$h1(
                    class = "menu-title",
                    "browsertools"
                )
            )
        )
    ),
    tags$header(
        class = "hero",
        tags$div(
            class = "hero-content",
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
                        class = "shiny-bound-input action-button b b-primary",
                        "Add CSS"
                    ),
                    tags$button(
                        id = "remove-css",
                        class = "text-example",
                        class = "shiny-bound-input action-button b b-primary",
                        "Remove CSS"
                    ),
                    tags$button(
                        id = "toggle-css",
                        class = "shiny-bound-input action-button b b-primary",
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
                        class = "shiny-bound-input action-button b b-primary",
                        "Hide"
                    ),
                    tags$button(
                        id = "show-elem",
                        class = "shiny-bound-input action-button b b-primary",
                        "Show"
                    ),
                    tags$button(
                        id = "reveal-elem",
                        class = "shiny-bound-input action-button b b-primary",
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
                        class = "shiny-bound-input action-button b b-primary",
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
                        class = "shiny-bound-input action-button b b-primary",
                        "Change Text"
                    ),
                    tags$button(
                        id = "change-html",
                        class = "shiny-bound-input action-button b b-primary",
                        "Change HTML"
                    ),
                    tags$button(
                        id = "append-html",
                        class = "shiny-bound-input action-button b b-primary",
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
                        class = "shiny-bound-input action-button b b-primary",
                        "Set Attribute"
                    ),
                    tags$button(
                        id = "remove-element-attribute",
                        class = "shiny-bound-input action-button b b-primary",
                        "Remove Attribute"
                    )
                ),
                tags$div(
                    id = "element-attribute-text-example",
                    class = "flex-child browsertools-results"
                )
            )
        ),
        tags$section(
            id = "scroll-to",
            class = "section",
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h2("Scrolling the page"),
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
                        class = "shiny-bound-input action-button b b-primary",
                        "Scroll to Top"
                    ),
                    tags$button(
                        id = "scroll-to-section-example",
                        class = "shiny-bound-input action-button b b-primary",
                        "Scroll to 'Getting Started'"
                    )
                )
            )
        )
    ),
    singleton(
        tags$script(src = "demo.min.js")
    )
)