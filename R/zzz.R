#' @importFrom units install_unit
.onLoad <- function(libname, pkgname) {

  units::install_unit("tput")
  units::install_unit("person")
  units::install_unit("death")
  units::install_unit("cancer")
  units::install_unit("veh")

  units::install_unit("VMT", "veh mi")

}
