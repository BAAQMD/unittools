#' get_units
#'
#' Works like [units::deparse_unit()], except it returns `NULL` by
#' default, rather than throwing an error.
#'
#'  @param x object
#'
#' @seealso [has_units()]
#'
#' @export
get_units <- function (x) {
  UseMethod("get_units")
}

#' @export
get_units.default <- function (x) {
  return(NULL)
}

#' @export
get_units.units <- function (x) {
  return(deparse_unit(x))
}
