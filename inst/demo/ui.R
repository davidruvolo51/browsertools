#'////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-05-25
#' MODIFIED: 2020-05-25
#' PURPOSE: browsertools demo
#' STATUS: in.progress
#' PACKAGES: shiny, browsertools
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# pkgs
suppressPackageStartupMessages(library(shiny))

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
            ),
            tags$li(
                class = "menu-item",
                tags$button(
                    id = "previous-section",
                    class = "shiny-bound-input action-button b b-nav",
                    tags$span(class = "visually-hidden", "previous section"),
                    icon$chevron(
                        id = "previous-icon",
                        class = "btn-icon",
                        title = "previous"
                    )
                )
            ),
            tags$li(
                class = "menu-item",
                tags$button(
                    id = "next-section",
                    class = "shiny-bound-input action-button b b-nav",
                    tags$span(class = "visually-hidden", "next section"),
                    icon$chevron(
                        id = "next-icon",
                        class = "btn-icon",
                        title = "next"
                    )
                )
            )
        )
    ),
    tags$header(
        class = "hero",
        tags$div(
            class = "hero-content",
            tags$h1("browsertools"),
            tags$h2("Package Demonstration")
        )
    ),
    tags$main(
        id = "main",
        class = "main",
        tags$section(
            class = "section",
            tags$h2("Introduction"),
            tags$p(
                "The", pkgname(), "package",
                "contains a series of functions for manipulating the Shiny UI",
                "from within the shiny server. This app will provide a series",
                "of examples that demonstrate how to use this package. Use",
                "buttons in the menubar to navigate the app."
            )
        ),
        tags$section(
            class = "section",
            `aria-labelledby` = "getting-started-title",
            tags$h2(id = "getting-started-title", "Getting Started"),
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$p(
                        "In your shiny app, call the function",
                        funcname("use_browsertools"), ".", "You can also use",
                        "the function", funcname("debug"), "in the server",
                        "while you are developing your app. This function",
                        "displays JavaScript errors in the R console."
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$pre(
                        tags$code(
                            "
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
                            shinyApp(ui, server)
                            "
                        )
                    )
                )
            )
        ),
        tags$section(
            class = "section",
            `aria-labelledby` = "modifying-css-classes-title",
            tags$h2(
                id = "modifying-css-classes-title",
                "Modifying CSS Classes"
            ),
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h3("Functions"),
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
                    )
                ),
                tags$div(
                    class = "flex-child browsertools-results",
                    tags$h3("add_css"),
                    tags$p(
                        id = "add-css-text-example",
                        "Click the button 'add css' to change the style of",
                        "this sentence."
                    ),
                    tags$button(
                        id = "add-css",
                        class = "shiny-bound-input action-button b b-primary",
                        "Add CSS"
                    ),
                    tags$h3("remove_css"),
                    tags$p(
                        id = "remove-css-text-example",
                        "Click the button 'remove css' to change the style",
                        "of this senteence."
                    ),
                    tags$button(
                        id = "remove-css",
                        class = "shiny-bound-input action-button b b-primary",
                        "Remove CSS"
                    ),
                    tags$h3("toggle_css"),
                    tags$p(
                        id = "toggle-css-text-example",
                        "Click the button 'toggle css' to change the style",
                        "of this sentence."
                    ),
                    tags$button(
                        id = "toggle-css",
                        class = "shiny-bound-input action-button b b-primary",
                        "Toggle CSS"
                    )
                )
            )
        ),
        tags$section(
            class = "section",
            `aria-labelledby` = "",
            tags$h2(
                id = "hiding",
                "Hiding and Showing Elements"
            ),
            tags$div(
                class = "flex flex-50x2-layout",
                tags$div(
                    class = "flex-child browsertools-info",
                    tags$h3("Functions"),
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
                    tags$h3("Hiding and Showing"),
                    tags$p(
                        id = "hide-show-text-example",
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
        tags$section(),
        tags$section()
    ),
    singleton(
        tags$script(src = "demo.min.js")
    )
)