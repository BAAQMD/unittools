#' @include try_install_unit.R

.onLoad <- function(libname, pkgname) {

  quietly_try_install <- function (...) {
    try(
      units::install_unit(...),
      silent = TRUE)
  }

  quietly_try_install("tput", "unitless")
  quietly_try_install("person", "unitless")
  quietly_try_install("death", "unitless")
  quietly_try_install("cancer", "unitless")
  quietly_try_install("veh", "unitless")
  quietly_try_install("VMT", "1 veh*mi")

}
