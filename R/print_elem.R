#' \code{print_elem}
#'
#' Find and print an HTML element in the R console. This function is designed
#' to be used during application development rather than production
#' applications as the corresponding JavaScript does not create a new
#' instance when called. Use this function to debug the HTML markup of
#' elements or simply to view a structure of an element. This may be
#' useful when applications are running the viewer pane rather than in the
#' browser.
#'
#' @param elem an element to select (i.e., ID, class, tag, etc.)
#'
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
#'
#' @seealso [debug()]
#' @keywords browsertools print debugging
#' @return Find and print an HTML element in the R console.
#'
#' @export
print_elem <- function(elem) {

    # validate
    if (!is.character(elem)) stop("argument 'elem' must be a character")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "print_elem",
        message = list(
            elem = elem
        )
    )

    # receive
    input <- session$input
    shiny::observeEvent(input$print_elem_response, {
        el <- jsonlite::fromJSON(input$print_elem_response)
        message("print_elem: ", elem, "\n", el, "\n")
    })
}