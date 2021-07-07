#' format_mortality_rate
#'
#' @param x object that _might_ be a `units` object
#' @param units (optional) character, like "death/Mperson"
#' @param digits (optional) integer
#' @param signif (optional) integer number of digits, as in [base::signif()]
#' @param suffix (optional) character
#'
#' @importFrom stringr str_detect str_c
#' @importFrom strtools format_count
#' @importFrom units set_units drop_units
#'
#' @return
#' @export
#'
format_mortality_rate <- function (
  x,
  units = "death/Mperson",
  digits = NULL,
  signif = Inf,
  suffix = NULL
) {

  if (is.null(digits)) {
    if (units == "death/person") {
      digits <- 5
    } else if (units == "death/Mperson") {
      digits <- 0
    } else {
      stop("Please supply `digits = ...` to `format_mortality_rate()`.")
    }
  }

  converted <-
    units::set_units(x, stringr::str_c(units, "/yr"), mode = "character")

  naive <-
    units::drop_units(converted)

  approximated <-
    base::signif(
      naive,
      digits = signif)

  formatted <-
    strtools::format_count(
      approximated,
      digits = digits)

  if (is.null(suffix)) {
    if (stringr::str_detect(units, "Mperson")) {
      suffix = "/M"
    } else {
      suffix = ""
    }
  }

  formatted <-
    stringr::str_c(
      formatted,
      suffix)

  return(formatted)

}
