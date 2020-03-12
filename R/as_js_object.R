#' \code{as_js_object}
#'
#' Restructures a data.frame to JavaScript Object
#' @param x a data frame object
#' @return Restructures a data.frame to JavaScript Object
#' @keywords browsertools, object
#' @examples
#' df <- as_js_object(x = iris)
#' console_log(df)
#' @export
as_js_object <- function(x) {
    session <- get_shiny_session()
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