#' has_units
#'
#' @param x
#' @param u
#'
#' @return
#' @export
#'
#' @examples
has_units <- function (x, u = NULL) {
  if (isFALSE(is_units(x))) return(FALSE)
  if (isTRUE(is.null(u))) return(is_units(x))
  x_units <- units::deparse_unit(x)
  u_units <- units::deparse_unit(as_units(1, u))
  return(x_units == u_units)
}
