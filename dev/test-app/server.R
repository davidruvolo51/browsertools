#'////////////////////////////////////////////////////////////////////////////
#' FILE: server.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-05-25
#' MODIFIED: 2020-07-30
#' PURPOSE: Shiny server for demo app
#' STATUS: working; ongoing
#' PACKAGES: shiny, browsertools
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# pkgs
suppressPackageStartupMessages(library(shiny))
devtools::load_all()

# server
server <- function(input, output, session) {

    debug()
    #'//////////////////////////////////////

    # ~ 1 ~
    # EVENTS: modifying css classes

    # add css
    observeEvent(input$`add-css`, {
        add_css(
            elem = "#css-text-example",
            css = "text"
        )
    })

    # remove css
    observeEvent(input$`remove-css`, {
        remove_css(
            elem = "#css-text-example",
            css = "text"
        )
    })

    # toggle css
    observeEvent(input$`toggle-css`, {
        toggle_css(
            elem = "#css-text-example",
            css = "text"
        )
    })

    #'//////////////////////////////////////

    # ~ 2 ~
    # EVENTS: hiding and showing elements

    # hide
    observeEvent(input$`hide-elem`, {
        hide_elem(
            elem = "#hide-show-text-example"
        )
    })

    # show
    observeEvent(input$`show-elem`, {
        show_elem(
            elem = "#hide-show-text-example"
        )
    })

    # reveal
    observeEvent(input$`reveal-elem`, {
        show_elem(
            elem = "#reveal-text-example"
        )
    })

    #'//////////////////////////////////////

    #' ~ 3 ~
    # EVENTS: Adding and Removing Elements

    # define object of phrases
    phrases_count <- reactiveVal(0)
    phrases <- c(
        "Hello, I made this sentence. :-)",
        "It is fun and easy to create new elements.",
        "What should I make now?",
        "Maybe I will continue to make new sentences",
        "Because it is so fun",
        "I will never get tired of making sentences",
        "But I think this is enough for now.",
        "I will add some more later",
        "Click the 'remove element' button to remove this sentence."
    )

    # add
    observeEvent(input$`remove-add-elem`, {

        # remove existing element
        remove_element(
            elem = "#remove-element-text-example"
        )

        # increment phrases
        phrases_count(phrases_count() + 1)
        if (phrases_count() > length(phrases)) phrases_count(1)

        # create new
        new_elem <- tags$p(
            id = "remove-element-text-example",
            phrases[phrases_count()]
        )

        # insert
        insert_adjacent_html(
            id = "remove-element-example-container",
            content = as.character(new_elem)
        )
    })

    #'//////////////////////////////////////

    #' ~ 4 ~
    #' EVENTS: Change the Content of an Element

    # inner_text
    observeEvent(input$`change-text`, {
        inner_text(
            elem = "#change-content-text-example",
            content = "This sentence was changed using the function inner_text"
        )
    })

    # inner_html
    observeEvent(input$`change-html`, {
        inner_html(
            elem = "#change-content-text-example",
            content = paste0(
                "This sentence was changed using the function ",
                "<span class='funcname'>inner_html</span>."
            )
        )
    })

    # append html.
    observeEvent(input$`append-html`, {
        inner_html(
            elem = "#change-content-text-example",
            content = paste0(
                "Using the argument",
                tags$code(class = "argname", "append"),
                ", you can add text or html content to an element."
            ),
            append = TRUE
        )
    })

    #'//////////////////////////////////////

    #' ~ 5 ~
    #' EVENTS: Changing Attributes

    # add attribute
    observeEvent(input$`set-element-attribute`, {
        txt <- tags$p(id = "greeting", `data-value` = "123", "Hello!")
        inner_text(
            elem = "#element-attribute-text-example",
            content = as.character(txt)
        )

        #' In order to demonstrate the changes to the HTML
        #' markup, the output is simulated. Instead, you would set the
        #' attribute like so:
        #' set_element_attribute(
        #'    elem = "#greeting",
        #'    attr = "data-value",
        #'    value = "123"
        #' )
    })

    # remove attribute
    observeEvent(input$`remove-element-attribute`, {
        txt <- tags$p(id = "greeting", "Hello!")
        inner_text(
            elem = "#element-attribute-text-example",
            content = as.character(txt)
        )

        #' In order to demonstrate the changes to the HTML
        #' markup, the output is simulated. Instead, you would remove the
        #' attribute like so:
        #' remove_element_attribute(
        #'    elem = "#greeting",
        #'    attr = "data-value"
        #' )
    })

    # get attribute
    observeEvent(input$`get-element-attribute`, {
        inner_html(
            elem = "#get-attribute-value-example",
            content = paste0(
                "\n",
                "id: ", input$`sample-attribute`$id, "\n",
                "class: ", input$`sample-attribute`$class, "\n",
                "aria-hidden: ", input$`sample-attribute`$`aria-hidden`, "\n",
                "data-value: ", input$`sample-attribute`$`data-value`, "\n"
            )
        )
    })

    #'//////////////////////////////////////

    #' ~ 6 ~
    #' EVENTS: Scrolling

    # to top
    observeEvent(input$`scroll-to-top-example`, {
        scroll_to()
    })

    # to 'getting started'
    observeEvent(input$`scroll-to-section-example`, {
        scroll_to(
            elem = "#getting-started"
        )
    })

    #'//////////////////////////////////////

    #' ~ 7 ~
    #' EVENTS: Console Messages

    # error
    observeEvent(input$`console-error-example`, {
        console_error(
            message = "Error: button 'Log Error' triggered an error."
        )
    })

    # message
    observeEvent(input$`console-log-example`, {
        console_log(
            message = "Message: this is a generic message"
        )
    })

    # table
    observeEvent(input$`console-table-example`, {
        d <- quakes[sample(seq_len(NROW(quakes)), 1), ]
        d <- as_js_object(d)
        console_log("Printing a random row from `quakes`:")
        console_table(d)
    })

    # warning
    observeEvent(input$`console-warning-example`, {
        console_warn(
            message = "Warning: clicking button 'Log Warning' will trigger an error."
        )
    })

    #'//////////////////////////////////////

    #' ~ 8 ~
    #' EVENTS: page refresh
    observeEvent(input$`page-refresh-example`, {
        scroll_to()
        refresh_page()
    })
}