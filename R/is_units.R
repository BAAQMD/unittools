#' is_units
#'
#' Is this a `units` object?
#'
#' @param x object
#' @return `TRUE` or `FALSE`
#'
#' @export
is_units <- function (x) {
  return(isTRUE(inherits(x, "units")))
}
