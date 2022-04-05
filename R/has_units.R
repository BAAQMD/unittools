#' has_units
#'
#' Returns `TRUE` if `x` is either (a) unitless, or is not of class "units".
#' If `x` is of class "units", can test whether the units are equal to `u`.
#'
#' @param x (vector) to be tested
#' @param u (optional) expected units
#'
#' @return `TRUE` or `FALSE`
#'
#' @export
has_units <- function (x, u = NULL) {
  if (isFALSE(is_units(x))) return(FALSE)
  if (isTRUE(is.null(u))) return(is_units(x))
  x_units <- units::deparse_unit(x)
  u_units <- units::deparse_unit(as_units(1, u))
  return(x_units == u_units)
}
