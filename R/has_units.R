#' has_units
#'
#' @param x object that _might_ be a `units` object
#' @param u character
#'
#' @importFrom units deparse_unit
#'
#' @return logical
#' @export
has_units <- function (x, u = NULL) {
  if (isFALSE(is_units(x))) return(FALSE)
  if (isTRUE(is.null(u))) return(is_units(x))
  x_units <- units::deparse_unit(x)
  u_units <- units::deparse_unit(units::as_units(1, u))
  return(x_units == u_units)
}
