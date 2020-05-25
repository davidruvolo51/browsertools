#'////////////////////////////////////////////////////////////////////////////
#' FILE: server.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-05-25
#' MODIFIED: 2020-05-25
#' PURPOSE: Shiny server for demo app
#' STATUS: in.progress
#' PACKAGES: shiny, browsertools
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////
server <- function(input, output, session) {

    #'//////////////////////////////////////

    # ~ 1 ~
    # EVENTS: modifying css classes

    # add css
    observeEvent(input$`add-css`, {
        browsertools::add_css(
            elem = "#add-css-text-example",
            css = ""
        )
    })

    # remove css
    observeEvent(input$`remove-css`, {
        browsertools::remove_css(
            elem = "#remove-css-text-example",
            css = ""
        )
    })

    # toggle css
    observeEvent(input$`toggle-css`, {
        browsertools::toggle_css(
            elem = "#toggle-css-text-example",
            css = ""
        )
    })

    #'//////////////////////////////////////
    
    # ~ 2 ~
    # EVENTS: hiding and showing elements

    # hide
    observeEvent(input$`hide-elem`, {
        browsertools::hide_elem(
            elem = "#hide-show-text-example"
        )
    })

    # show
    observeEvent(input$`show-elem`, {
        browsertools::show_elem(
            elem = "#hide-show-text-example"
        )
    })

    # reveal
    observeEvent(input$`reveal-elem`, {
        browsertools::show_elem(
            elem = "#reveal-text-example"
        )
    })
}