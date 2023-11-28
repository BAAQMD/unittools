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
  ux <- get_units(x)
  if (is.null(ux)) {
    return(FALSE)
  } else if (!is.null(u)) {
    return (ux == get_units(set_units(1, u, mode = "character")))
  } else {
    return(TRUE)
  }
}
