#' \code{print_elem}
#'
#' Select and print an html element in both the JavaScript and R consoles
#' @return Select and print an element in both the JavaScript and R console
#' @param elem an element to select (i.e., ID, class, tag, etc.)
#' @examples
#' if (interactive()) {
#'    ui <- tagList(
#'        browsertools::use_browsertools(),
#'        tags$div(
#'          id = "mydiv",
#'          tags$h2("My Element"),
#'          tags$p(
#'            "This is an example element. The structure will be printed",
#'            "in the R console."
#'          )
#'        )
#'    )
#'    server <- function(input, output) {
#'      observe({
#'         print_elem(elem = "#mydiv")
#'      })
#'    }
#' }
#' @keywords browsertools, print
#' @importFrom shiny getDefaultReactiveDomain
#' @importFrom jsonlite fromJSON
#' @export
print_elem <- function(elem) {

    # validate
    if (!is.character(elem)) stop("argument 'elem' must be a character")

    # send
    session <- getDefaultReactiveDomain()
    session$sendCustomMessage("print_elem", list(elem = elem))

    # receive
    input <- session$input
    observeEvent(input$print_elem_response, {
        el <- fromJSON(input$print_elem_response)
        message("print_elem: ", elem, "\n", el, "\n")
    })
}