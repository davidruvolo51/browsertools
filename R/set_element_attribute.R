#' \code{set_element_attribute}
#'
#' Set an attribute of an html element
#'
#' @param elem the id or class name of an html element
#' @param attr the name of the attribute to update
#' @param value the value to add to the attribute
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
#'     tags$h2("Set Element Attribute Example"),
#'     tags$p(
#'       "Click the button below to set an attribute of an element"
#'     ),
#'     tags$button(
#'       id = "setAttr",
#'       class = "shiny-bound-input action-button",
#'       "Set Attribute"
#'     ),
#'     tags$p(
#'       id = "mytext",
#'       `aria-hidden` = "true",
#'       "This element will be modified."
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$removeAttr, {
#'       browsertools::set_element_attribute(
#'         elem = "#mytext",
#'         attr = "aria-hidden",
#'         value = "true"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [remove_element_attribute()], [print_elem()]
#' @keywords browsertools attribute value
#' @return Set an attribute of an html element
#'
#' @export
set_element_attribute <- function(elem, attr, value) {

    # validate
    if (is.null(elem)) stop("argument 'elem' is undefined")
    if (is.null(attr)) stop("argument 'attr' is undefined")
    if (is.null(value)) stop("argument 'value' is undefined")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "set_element_attribute",
        message = list(
            elem = elem,
            attr = attr,
            value = value
        )
    )
}