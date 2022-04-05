#' Set commonly-used units
#'
#' @name as-helpers
#' @rdname as-helpers
NULL

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

#' @rdname as-helpers
#' @export
as_CANCRISK <- function (x, u = "cancer/Mperson") {
  set_units(x, u, mode = "character")
}

#' @rdname as-helpers
#' @export
as_exposure <- function (x, intensity, duration = NULL, per_capita = FALSE) {
  .Deprecated()
  u <- str_c("person", intensity, sep = "*")
  if (isTRUE(per_capita)) {
    u <- str_c(u, "/person")
  }
  u <- str_c(u, duration, sep = "*")
  set_units(x, u, mode = "character", force_single_symbol = FALSE)
}

#' @rdname as-helpers
#' @export
as_ugm3_exposure <- function (...) {
  as_exposure(..., intensity = "ug/m^3")
}
