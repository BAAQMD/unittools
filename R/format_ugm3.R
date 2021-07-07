#' format_ugm3
#'
#' @param x object that _might_ be a `units` object
#' @param digits (optional) integer
#'
#' @importFrom units drop_units set_units
#' @importFrom strtools format_digits
#'
#' @return
#' @export
#'
format_ugm3 <- function (
  x,
  digits = 3
) {
  value <- units::drop_units(units::set_units(x, "ug/m^3"))
  formatted <- strtools::format_digits(value, digits = digits)
  return(formatted)
}
