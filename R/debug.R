
#' \code{Debug}
#'
#' Print JavaScript errors in the R console. This function
#' is designed to be used within the Shiny Server
#' @return Print JavaScript errors in the R console
#' @keywords browsertools, debug, error
#' @examples
#' browsertools::debug()
#' @importFrom shiny getDefaultReactiveDomain observeEvent
#' @importFrom jsonlite fromJSON
#' @export
debug <- function() {

    # session
    session <- getDefaultReactiveDomain()

    # send
    session$sendCustomMessage("browsertools_debug", list(debug = TRUE))

    # receive
    input <- session$input
    observeEvent(input$browsertools_debug, {
        e <- fromJSON(input$browsertools_debug)
        warning(
            "Error in ", e$func, ":\n  ", e$name, ": ", e$message,
            call. = FALSE
        )
    })
}