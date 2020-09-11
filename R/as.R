#' Set commonly-used units
#'
#' @rdname as-helpers

#' @rdname as-helpers
#' @export
as_ugm3 <- function (x) {
  set_units(x, "ug/m^3")
}

#' @rdname as-helpers
#' @export
as_person <- function (x) {
  set_units(x, "person")
}

#' @rdname as-helpers
#' @export
as_population <- function (x) {
  .Deprecated("as_person")
  as_person(x)
}


#' @rdname as-helpers
#' @export
as_mortality <- function (x) {
  set_units(x, "death/yr")
}

#' @rdname as-helpers
#' @export
as_mortality_rate <- function (x, u = "death/Mperson/yr") {
  set_units(x, u, mode = "character")
}
