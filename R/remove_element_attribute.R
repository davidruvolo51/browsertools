#' \code{remove_element_attribute}
#'
#' Removes an html attribute from an element
#'
#' @param elem an ID of the html element to be modified
#' @param attr the name of the attribute to remove
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$head(
#'       tags$style(
#'         "[aria-hidden='true'] {
#'              position: absolute;
#'              width: 1px;
#'              height: 1px;
#'              margin: -1px;
#'              clip: rect(0, 0, 0, 0);
#'              clip: rect(0 0 0 0);
#'              overflow: hidden;
#'              white-space: nowrap;
#'         }"
#'       )
#'     ),
#'     tags$h2("Remove Element Attribute Example"),
#'     tags$p(
#'       "Click the button below to remove an attribute of a hidden element"
#'     ),
#'     tags$button(
#'       id = "removeAttr",
#'       class = "shiny-bound-input action-button",
#'       "Remove Attribute"
#'     ),
#'     tags$p(
#'       id = "hidden-text",
#'       `aria-hidden` = "true",
#'       "This is a hidden element"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeAttr, {
#'       browsertools::remove_element_attribute(
#'         elem = "#hidden-text",
#'         attr = "aria-hidden"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [set_element_attribute()], [print_elem()]
#' @keywords browsertools remove attribute
#' @return Remove an attribute from an html element
#'
#' @export
remove_element_attribute <- function(elem, attr) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(attr)) stop("argument 'attr' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "remove_element_attribute",
        message = list(
            elem = elem,
            attr = attr
        )
    )
}