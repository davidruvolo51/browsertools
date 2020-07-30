#' \code{inner_text}
#'
#' Modify the text of an element
#'
#' @param elem an element to select (e.g., ID, class, tag, etc.)
#' @param content content to insert
#' @param append an option that appends value of string or replaces it
#' @param delay an optional arg that adds a brief pause before
#'              sending the content to the html element. Ideal
#'              for content that is rendered server-side. Input
#'              time is in milliseconds.
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Inner Html Example"),
#'     tags$p("Click the button to update the following message."),
#'     tags$p(
#'       id = "textToUpdate",
#'       "[This text will be updated]"
#'     ),
#'     tags$button(
#'       id = "updateText",
#'       class = "shiny-bound-input action-button",
#'       "Update Text"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     browsertools::inner_text(
#'       elem = "#textToUpdate",
#'       content = "This is a new message!"
#'     )
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText}
#'
#' @seealso [inner_html()], [insert_adjacent_html()]
#' @keywords browsertools innertext
#' @return Modify the text of an element
#'
#' @export
inner_text <- function(elem, content, append = FALSE, delay = NULL) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(content)) stop("argument 'content' is undefined")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "inner_text",
        message = list(
            elem = elem,
            content = as.character(content),
            append = append,
            delay = delay
        )
    )
}