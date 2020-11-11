#' ////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-11-09
#' MODIFIED: 2020-11-10
#' PURPOSE: prod app for reviewing all features
#' STATUS: in.progress
#' PACKAGES: shiny; browsertools
#' COMMENTS: NA
#' ////////////////////////////////////////////////////////////////////////////

#' pkgs
suppressPackageStartupMessages(library(shiny))
devtools::load_all()

#' add resource path
addResourcePath(
    "browsertools",
    "~/Github/browsertools/inst/browsertools/public/"
)

#' ui
ui <- tagList(
    tags$head(
        tags$meta(
            name = "viewport",
            content = "width=device-width, initial-scale=1"
        ),
        tags$style(
            "html, body {
                font-family: Helvetica, Arial, sans-serif;
                font-size: 11pt;
                padding: 0;
                margin: 0;
                color: #353535;
            }",
            "p {
                line-height: 1.5;
                color: #3f454b;
            }",
            "button {
                cursor: pointer;
                padding: 4px;
                margin: 4px 0;
            }",
            "main {
                display: flex;
                justify-content: center;
                align-items: stretch;
                flex-direction: row;
                height: 100vh;
                margin: 0 auto;
            }",
            "#main-panel {
                width: 60%;
                padding: 1em 3em;
            }",
            "#output-panel {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 40%;
                min-width: 200px;
                background-color: #f6f6f6;
                padding: 3em;
            }",
            ".sub-container {
                display: border-box;
            }",
            ".square {
                width: 75px;
                height: 75px;
                background-color: #2EBFA5;
                margin: 12px auto;
            }",
            ".square-lg {
                width: 150px;
                height: 150px;
            }",
            ".blue-bkg {
                background-color: #2d7ddd;
            }",
            ".display-scroll-section {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }"
        ),
        tags$title("Browsertools Production Environment App")
    ),
    tags$main(
        tags$div(
            id = "main-panel",
            class = "sub-container",
            tags$h1("Browsertools"),
            tags$section(
                tags$h2("Modifying the Square"),
                tags$p(
                    "Click the buttons below to modify appearance of the ",
                    "square. Doing so will set the background color to ",
                    "blue, increase the size of the square, and much more.",
                    "The square starts off hidden, so click 'Show the square'",
                    " button to get started. Have fun!"
                ),
                tags$div(
                    tags$h3("Modify CSS Properties"),
                    tags$button(
                        id = "css-add",
                        class = "shiny-bound-input action-button",
                        "Add Color and Size"
                    ),
                    tags$button(
                        id = "css-remove",
                        class = "shiny-bound-input action-button",
                        "Reset Color and Size"
                    ),
                    tags$button(
                        id = "css-toggle",
                        class = "shiny-bound-input action-button",
                        "Toggle Color and Size"
                    )
                ),
                tags$div(
                    tags$h3("Modifying Visibility"),
                    tags$button(
                        id = "square-hide",
                        class = "shiny-bound-input action-button",
                        "Hide the Square"
                    ),
                    tags$button(
                        id = "square-show",
                        class = "shiny-bound-input action-button",
                        "Show the Square"
                    ),
                    tags$button(
                        id = "square-toggle",
                        class = "shiny-bound-input action-button",
                        "Togge the Visibility"
                    )
                ),
                tags$div(
                    tags$h3("Modifying Inner Content"),
                    tags$button(
                        id = "square-inner-text",
                        class = "shiny-bound-input action-button",
                        "Insert Raw Text"
                    ),
                    tags$button(
                        id = "square-inner-html",
                        class = "shiny-bound-input action-button",
                        "Insert HTML"
                    ),
                    tags$button(
                        id = "square-insert-html",
                        class = "shiny-bound-input action-button",
                        "Insert HTML After Square"
                    ),
                    tags$button(
                        id = "square-print-html",
                        class = "shiny-bound-input action-button",
                        "Print square markup in R console"
                    )
                ),
                tags$div(
                    tags$h3("Modifying HTML Attributes"),
                    tags$button(
                        id = "square-add-attr",
                        class = "shiny-bound-input action-button",
                        "Add `data-value` attr"
                    ),
                    tags$button(
                        id = "square-remove-attr",
                        class = "shiny-bound-input action-button",
                        "Remove `data-value` attr"
                    ),
                    tags$button(
                        id = "square-print-attr",
                        class = "shiny-bound-input action-button",
                        "Print Element Attributes"
                    )
                ),
                tags$div(
                    tags$h3("Modify Elements"),
                    tags$button(
                        id = "doc-random-title",
                        class = "shiny-bound-input action-button",
                        "Change Document Title"
                    ),
                    tags$button(
                        id = "doc-refresh",
                        class = "shiny-bound-input action-button",
                        "Refresh Page"
                    )
                ),
                tags$div(
                    id = "scroll-example-container",
                    tags$h3("Scroll Example"),
                    tags$button(
                        id = "scroll-button",
                        class = "shiny-bound-input action-button",
                        "Start Scroll Example"
                    )
                )
            )
        ),
        tags$aside(
            id = "output-panel",
            class = "sub-container",
            `aria-label` = "output panel",
            hidden(
                tags$div(
                    id = "css-square",
                    class = "square",
                    enable_attributes()
                )
            ),
        )
    ),
    hidden(
        tags$div(
            id = "scroll-section",
            tags$button(
                id = "scroll-to-top",
                class = "shiny-bound-input action-button",
                "Scroll to the top of the page"
            ),
            tags$button(
                id = "scroll-to-section",
                class = "shiny-bound-input action-button",
                "Scroll to the `Scroll Example` section"
            ),
        )
    ),
    tags$script(src = "browsertools/browsertools.min.js")
)

#' server
server <- function(input, output) {

    # server on load
    debug()
    console_error("🚨 Square is hidden by default.")
    phrases <- c(
        "👽 I'm a martian",
        "🍱 Yum! A tasty bento box",
        "🤡 Uh oh, a creepy clown",
        "🎨 Let's paint!",
        "🚨 Warning! Warning!",
        "✏️ Some message",
        "🍻 Cheers!"
    )

    #' //////////////////////////////////////
    #' square css
    observeEvent(input$`css-add`, {
        console_log("🎨 Added New CSS Styles")
        add_css(elem = "#css-square", css = c("blue-bkg", "square-lg"))
    })
    observeEvent(input$`css-remove`, {
        console_warn("🚧 Styles were removed")
        remove_css(elem = "#css-square", css = c("blue-bkg", "square-lg"))
    })
    observeEvent(input$`css-toggle`, {
        console_warn("🙈 Toggling. I have no idea what's happening!")
        toggle_css(elem = "#css-square", css = c("blue-bkg", "square-lg"))
    })

    #' //////////////////////////////////////
    #' square state
    observeEvent(input$`square-hide`, {
        console_warn("🔥 Careful! The square is now hidden.")
        hide_elem(elem = "#css-square")
    })
    observeEvent(input$`square-show`, {
        console_log("🚀 Good. The square is now shown")
        show_elem(elem = "#css-square")
    })
    observeEvent(input$`square-toggle`, {
        console_warn("🙈 Toggling. I have no idea what's happening!")
        toggle_elem(elem = "#css-square")
    })

    #'//////////////////////////////////////
    #' html events
    observeEvent(input$`square-inner-text`, {
        inner_text(elem = "#css-square", content = "JavaScript is cool!")
    })
    observeEvent(input$`square-inner-html`, {
        inner_html(
            elem = "#css-square",
            content = tags$strong("🎉 Suprise!")
        )
    })
    observeEvent(input$`square-insert-html`, {
        insert_adjacent_html(
            id = "css-square",
            content = tags$p(
                "Checkout out the",
                tags$a(
                    href = "https://github.com/davidruvolo51/browsertools",
                    "browsertools"
                ),
                "GitHub Repo!"
            )
        )
    })
    observeEvent(input$`square-print-html`, {
        print_elem(elem = "#css-square")
    })

    #'//////////////////////////////////////
    #' Modifying Element Attributes
    observeEvent(input$`square-add-attr`, {
        set_element_attribute(
            elem = "#css-square",
            attr = "data-value",
            value = sample(phrases, 1)
        )
    })

    observeEvent(input$`square-remove-attr`, {
        remove_element_attribute(
            elem = "#css-square",
            attr = "data-value"
        )
    })
    observeEvent(input$`square-print-attr`, {
        d <- input$`css-square`
        dt <- data.frame(
            attribs = names(d),
            values = unlist(d, use.names = FALSE)
        )
        console_table(data = dt)
    })

    #'//////////////////////////////////////
    #' other behaviors
    observeEvent(input$`doc-random-title`, {
        set_document_title(title = sample(phrases, 1))
    })
    observeEvent(input$`doc-refresh`, {
        refresh_page()
    })

    #'//////////////////////////////////////
    #' scroll example
    observeEvent(input$`scroll-button`, {
        show_elem(elem = "#scroll-section")
        add_css(elem = "#scroll-section", css = "display-scroll-section")

    })
    observeEvent(input$`scroll-to-top`, {
        scroll_to()
        hide_elem(elem = "#scroll-section")
        remove_css(elem = "#scroll-section", css = "display-scroll-section")
    })
    observeEvent(input$`scroll-to-section`, {
        scroll_to(elem = "#scroll-example-container")
    })
}

#' app
shinyApp(ui, server)