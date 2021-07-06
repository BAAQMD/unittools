#' @include try_install_unit.R

.onLoad <- function(libname, pkgname) {

  try_install_unit(symbol = "tput", def = "unitless", name = "throughput")

  try_install_unit(symbol = "person", def = "unitless", name = "person")
  try_install_unit(symbol = "death", def = "unitless", name = "death")
  try_install_unit(symbol = "cancer", def = "unitless", name = "cancer")

  try_install_unit(symbol = "veh", def = "unitless", name = "vehicle")
  try_install_unit(symbol = "VMT", def = "1 veh*mi", name = "vehicle-mile")

}
