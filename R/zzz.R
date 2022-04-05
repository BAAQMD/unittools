#' @include try_install_unit.R

.onLoad <- function(libname, pkgname) {

  try_install_unit("tput", "unitless")
  try_install_unit("person", "unitless")
  try_install_unit("death", "unitless")
  try_install_unit("cancer", "unitless")
  try_install_unit("veh", "unitless")
  try_install_unit("VMT", "1 veh*mi")

}
