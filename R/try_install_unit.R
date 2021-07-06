#' try_install_unit
#'
#' Just like `units::install_unit()`, but re-raises error(s) as warning(s).
#'
#' @param ... passed to [units::install_unit()]
#'
#' @note The `units` package used to support `install_symbolic_unit(..., warn = TRUE)`.
#' With that syntax, attempting to install an already-installed unit just led to a warning;
#' it didn't throw an error. This is a way of recreating that behavior.
#'     There doesn't seem to be a function offered by `units` to check whether a symbolic
#' unit is already installed. If there were, that would seem to be more prefereable than
#' a blanket `tryCatch()`.
#'
#' @export
try_install_unit <- function (...) {

  tryCatch(
    units::install_unit(...),
    error = function (e) {
      warning(e)
    })

}
