.onLoad <- function(libname, pkgname) {

  install_unit <- function (u) {
    units::install_symbolic_unit(u, warn = FALSE, dimensionless = FALSE)
  }

  install_unit("tput")
  install_unit("person")
  install_unit("death")
  install_unit("cancer")
  install_unit("veh")

  try(
    units::install_conversion_constant("VMT", "veh*mi", 1),
    silent = TRUE)

}
