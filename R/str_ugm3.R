#' str_ugm3
#'
#' @return
#' @export
#'
str_ugm3 <- function () {
  if (isTRUE(knitr::is_html_output())) {
    return("µg/m<sup>3</sup>")
  } else if (isTRUE(knitr::is_latex_output())) {
    return("µg/m$^3$")
  } else {
    return("µg/m3")
  }
}
