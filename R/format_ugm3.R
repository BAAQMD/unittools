#' format_ugm3
#'
#' @param x
#' @param digits
#'
#' @return
#' @export
#'
format_ugm3 <- function (
  x,
  digits = 3
) {
  set_units(x, "ug/m^3")
  format_digits(drop_units(x), digits = digits)
}
