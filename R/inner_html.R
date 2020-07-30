#' \code{inner_html}
#'
#' Update the content of an element by id or class name
#'
#' @param elem the ID or class name of an html element
#' @param content an html string, Shiny tag, or Shiny tag list
#' @param append an option that appends value of string or replaces it
#' @param delay an optional arg to add a brief pause
#'              before sending the content to the html element.
#'              Ideal for content that is rendered by the server.
#'              Input is time in milliseconds.
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
#'     browsertools::inner_html(
#'       elem = "#textToUpdate",
#'       content = tags$strong("This is a bold message!")
#'     )
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML}
#'
#' @seealso [inner_text()], [insert_adjacent_html()]
#' @keywords innerhtml
#' @return Update the content of an element by id or class name
#'
#' @export
inner_html <- function(elem, content, append = FALSE, delay = NULL) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(content)) stop("argument 'content' is undefined")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "inner_html",
        message = list(
            elem = elem,
            content = as.character(content),
            append = append,
            delay = delay
        )
    )
}