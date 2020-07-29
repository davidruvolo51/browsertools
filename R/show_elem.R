#' \code{show_elem}
#'
#' Shows an html element by id or class name. This function, by defauly,
#' removes the class \code{hidden} from the desired element and updates
#' aria attriute \code{hidden}. In your css file, create a corresponding
#' selector called \code{hidden} and define the show styles. This allows you
#' to add delays and apply other transformations.
#'
#' @param elem the id or class name of an html elem
#' @param css a string containing the class to remove from an html element
#'              (default class is \code{hidden})
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$main(
#'           tags$h2("Show Element Example"),
#'           tags$p(
#'               id = "my-text-example",
#'               "Click the button below to show a hidden element."
#'           ),
#'           tags$button(
#'               id = "showElement",
#'               class = "shiny-bound-input action-button",
#'               "Show Element"
#'           ),
#'           browsertools::hidden(
#'               tags$p(
#'                   id = "hiddenMessage",
#'                   "You found the hidden message!"
#'               )
#'           )
#'       )
#'   )
#'   server <- function(input, output, session) {
#'       observeEvent(input$showElement, {
#'           browsertools::show_elem(
#'               elem = "#hiddenMessage"
#'           )
#'       })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [hide_elem()], [hidden()], [toggle_elem()]
#' @keywords browsertools css show
#' @return Show a hidden html element
#'
#' @export
show_elem <- function(elem, css = "browsertools-hidden") {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(css)) stop("argument 'css' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "show_elem",
        message = list(
            elem = elem,
            css = css
        )
    )
}