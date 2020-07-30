#' \code{set_document_title}
#'
#' Set or change the document title
#'
#' @param title a string containing a title of the document
#' @param append if TRUE the title will be added to the current title
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Setting the Document Title"),
#'     tags$p("Enter a new title for the document"),
#'     tags$input(
#'       id = "titleInput",
#'       class = "shiny-bound-input",
#'       type = "text"
#'     ),
#'     tags$button(
#'        id = "submit",
#'        class = "shiny-bound-input action-button",
#'        "Submit"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$submit, {
#'        browsertools::set_document_title(
#'          title = as.character(input$titleInput)
#'        )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @keywords browsertools document title
#' @return Set or change the document title
#'
#' @export
set_document_title <- function(title, append = FALSE) {

    # validate
    if (!is.character(title)) stop("argument 'title' must be a character")
    if (!is.logical(append)) stop("argument 'append' must be TRUE or FALSE")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "set_document_title",
        message = list(
            title = title,
            append = append
        )
    )
}