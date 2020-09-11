#' str_PM25
#'
#' @return
#' @export
#'
str_PM25 <- function () {
  if (isTRUE(knitr::is_html_output())) {
    return("PM<sub>2.5</sub>")
  } else if (isTRUE(knitr::is_latex_output())) {
    return("PM$_{2.5}$")
  } else {
    return("PM2.5")
  }
}
