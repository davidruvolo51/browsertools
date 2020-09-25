#'////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-08-03
#' MODIFIED: 2020-08-04
#' PURPOSE: Demo shiny app for testing functions
#' STATUS: ongoing
#' PACKAGES: shiny; browsertools
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# pkgs
library(shiny)

# add resource path
addResourcePath(
    "browsertools",
    "~/Github/browsertools/inst/browsertools/public"
)

# load package functions
devtools::load_all()

# ui
ui <- tagList(
    tags$head(
        tags$meta(
            name = "viewport",
            content = "width=device-width, initial-scale=1"
        ),
        tags$style(
            "html, body {
                font-family: Helvetica;
            }",
            "main {
                width: 90%;
                max-width: 972px;
                margin: 0 auto;
            }",
            "#square {
                width: 75px;
                height: 75px;
                background-color: #2EBFA5;
                margin: 12px;
            }"
        ),
        tags$title("Browsertools Development App")
    ),
    tags$main(
        tags$h2("Browsertools Development App"),
        tags$p(
            "Currently, the dev app is used to test the browsertools",
            "functions:", tags$code("hide_elem"), tags$code("show_elem"),
            "and", tags$code("toggle_elem"), ". Click one of the following",
            "buttons to toggle the state of the green square."
        ),
        tags$button(
            id = "hide",
            class = "shiny-bound-input action-button",
            "Hide"
        ),
        tags$button(
            id = "show",
            class = "shiny-bound-input action-button",
            "Show"
        ),
        tags$button(
            id = "toggle",
            class = "shiny-bound-input action-button",
            "Toggle"
        ),
        hidden(
            tags$div(id = "square")
        )
    ),
    tags$script(src = "browsertools/browsertools.min.js")
)


# server
server <- function(input, output, session) {

    # browertools's debug function
    debug()

    observeEvent(input$hide, {
        hide_elem(elem = "#square")
    })

    observeEvent(input$show, {
        show_elem(elem = "#square")
    })

    observeEvent(input$toggle, {
        toggle_elem(elem = "#square")
    })
}


# app
shinyApp(ui, server)