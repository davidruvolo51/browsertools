#' \code{as_js_object}
#'
#' Restructures a data.frame to JavaScript Object
#' @param x a data frame object
#' @return Restructures a data.frame to JavaScript Object
#' @keywords browsertools, object
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  ui <- tagList(
#'      browsertools::use_browsertools(),
#'      tags$p("Open the browser's dev console")
#'  )
#'  server <- function(input, output, session) {
#'      n <- 10
#'      df <- data.frame(
#'          group = sample(letters, n),
#'          x = rnorm(n),
#'          y = rnorm(n),
#'          z = rnorm(n)
#'      )
#'      browsertools::console_table(data = df)
#'   }
#'   shinyApp(ui, server)
#' }
#' @importFrom shiny getDefaultReactiveDomain
#' @export
as_js_object <- function(x) {
    session <- getDefaultReactiveDomain()
    d <- as.data.frame(x)
    parent <- list()
    lapply(seq_len(NROW(d)), function(row) {
        child <- list()
        lapply(seq_len(NCOL(d)), function(col) {
            child[[col]] <<- d[row, col]
            names(child)[[col]] <<- colnames(d)[col]
        })
        parent[[row]] <<- child
    })
    return(parent)
}