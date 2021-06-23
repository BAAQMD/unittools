#' Restore units to tabular data
#'
#' Operations on tabular data or geodata can result in unit-aware columns being returned to a naive state.
#' This function easily restores them.
#'
#' @param to tabular data or geodata
#' @param from tabular data or geodata
#' @return same as `from`, but with units set on columns as they were in `to`
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
#' @importFrom dplyr bind_cols %>%
#' @importFrom purrr possibly map map2
restore_units <- function (
  to,
  from
) {

  # Might support other types in the future
  stopifnot(inherits(from, "data.frame"))

  # Helper function: return NA if not a `units` object; otherwise, return the unit
  safely_deparse <-
    purrr::possibly(
      units::deparse_unit,
      otherwise = NA)

  # List of units (or NA) associated with each column of `from`
  unit_list <-
    purrr::map(
      from,
      safely_deparse)

  # If NA or NULL, leave alone, else restore units
  restore_units_ <- function (x, u) {
    if (is.null(u) || is.na(u)) {
      return(x)
    } else {
      return(units::set_units(x, u, mode="character"))
    }
  }

  # Restore original units to each column, then re-bind columns
  restored_data <-
    purrr::map2(
      to,
      unit_list[names(to)],
      restore_units_) %>%
    bind_cols()

  return(restored_data)

}
