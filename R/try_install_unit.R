#' try_install_unit
#'
#' Just like `units::install_unit()`, except that it does nothing if you try to "re-install" an existing unit.
#' (Unless you pass `verbose = TRUE`, in which case it will just output a message to that effect.)
#'
#' @param ... passed to [units::install_unit()]
#'
#' @importFrom stringr str_detect
#'
#' @note The `units` package used to support `install_symbolic_unit(..., warn = TRUE)`.
#' With that syntax, attempting to install an already-installed unit just led to a warning;
#' it didn't throw an error.
#'     There doesn't seem to be a function offered by `units` to check whether a symbolic
#' unit is already installed. If there were, that would seem to be more preferable.
#'
#' @export
try_install_unit <- function (
  symbol = character(0),
  def = character(0),
  name = character(0),
  verbose = FALSE) {

  msg <- function (...) if (isTRUE(verbose)) {
    message("[try_install_unit] ", paste0(...))
  }

  handle_error <- function (e) {
    err_msg <- as.character(e)
    if (stringr::str_detect(err_msg, "already maps to existing but different unit")) {
      msg(e)
      return(invisible(NULL)) # pass
    }
    stop(e)
  }

  tryCatch(
    units::install_unit(symbol = symbol, def = def, name = name),
    error = handle_error)

}
