#' \code{print_elem}
#'
#' Select and print an html element in both the JavaScript and R consoles
#' @return Select and print an element in both the JavaScript and R console
#' @param elem an element to select (i.e., ID, class, tag, etc.)
#' @examples
#' print_elem(elem = "#mydiv")
#' @keywords browsertools, print
#' @importFrom shiny getDefaultReactiveDomain
#' @importFrom jsonlite fromJSON
#' @export
print_elem <- function(elem) {

    # validate
    if (is.null(elem)) stop("argument 'elem' cannot be empty")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("print_elem", list(elem = elem))

    # receive
    input <- session$input
    observeEvent(input$print_elem_response, {
        el <- fromJSON(input$print_elem_response)
        cat("print_elem:\n ", el, "\n")
    })
}