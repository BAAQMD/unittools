#' Restore units to vector or tabular data
#'
#' Operations on tabular data or geodata can result in unit-aware columns being returned to a naive state.
#' This function easily restores them.
#'
#' @param to numeric vector, tabular data or geodata
#' @param from same class as `to`
#' @return same value(s) as `from`, but with units set as they were in `to`
#'
#' @importFrom units deparse_unit set_units
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' library(units)
#' df <- mutate(mtcars, mpg = as_units(mpg, "mi/gal"))
#' grouped <- group_by(df, cyl)
#' summarised <- summarise_at(grouped, vars(mpg), mean)
#' restore_units(summarised, from = df)
#' }
#'
#' @export
restore_units <- function (to, from) {
  UseMethod("restore_units")
}

#' @rdname restore_units
#' @export
restore_units.default <- function (to, from) {
  if (has_units(from)) {
    u <- units::deparse_unit(from)
    return(units::set_units(to, u, mode = "character"))
  } else {
    return(to)
  }
}

#' @rdname restore_units
#' @export
restore_units.data.frame <- function (to, from) {
  for (j in unlist(which(sapply(from, has_units)))) {
    nm <- names(from)[j]
    if (nm %in% names(from)) {
      to[nm] <- restore_units(to[[nm]], from[[nm]])
    }
  }
  return(to)
}
