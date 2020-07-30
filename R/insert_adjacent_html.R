#' \code{insert_adjacent_html}
#'
#' Create and render a new html element(s) using shiny tags. Content is added
#' to the document using a reference container (i.e., body, div, etc.). Use
#' the argument `position` to specify where the content should be added.
#'
#' @param id an id of the parent element to render new elements into
#' @param content An html string, shiny tag, or shiny tag list
#' @param position a position relative to the reference element
#'             (i.e., \code{beforebegin}, \code{afterbegin}, \code{beforeend},
#'             or \code{afterend})
#'
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
#'     content = tagList(
#'         tags$h2("Hello, world!"),
#'         tags$p("How are you doing today?")
#'     ),
#'     position = "afterbegin"
#'   )
#' }
#' }
#'
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML}
#'
#' @seealso [inner_text()], [inner_html()]
#' @keywords browsertools html insertHTML
#' @return Create a new html element using shiny tags as a child of an element
#'
#' @export
insert_adjacent_html <- function(id, content, position = "beforeend") {

    # validate
    if (is.null(id)) stop("argument 'id' error is undefined")
    if (is.null(content)) stop("argument 'content' error is undefined")
    if (is.null(position)) stop("argument 'position' error is undefined")

    # validate argument "position"
    defaults <- c("beforebegin", "afterbegin", "beforeend", "afterend")
    if (!position %in% defaults) {
        stop("input for 'position' is not valid")
    }

    # send message
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "insert_adjacent_html",
        message = list(
            id = id,
            content = as.character(content),
            position = position
        )
    )
}