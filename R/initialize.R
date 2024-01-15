#' Set up firework scripts and loader
#'
#' Calls to load fireworks to a page
#'
#' @param startOnLoad start the fireworks on load
#'
#' @section Examples for r2social:
#' More examples and demo pages are located at this link -
#' \url{https://r2social.obi.obianom.com}.
#'
#' @return scripts to load fireworks and trigger to start fireworks
#'
#' @examples
#' connectButton(
#' link = "//rpkg.net",
#' visit.us = TRUE,
#' position = "left")
#' connectButton(
#' link = "//www.linkedin.com/in/oobianom",
#' linkedin = TRUE,
#' position = "right")
#' connectButton(
#' link = "//x.com/R2Rpkg",
#' x = TRUE, position = "inline")
#'
#' # NOT styled
#' connectButton(
#' link = "//rpkg.net",
#' visit.us = TRUE,
#' position = "left")
#' connectButton(
#' link = "//www.linkedin.com/in/oobianom",
#' linkedin = TRUE,
#' plain = TRUE,
#' position = "right")
#' connectButton(
#' link = "//x.com/R2Rpkg",
#' x = TRUE, position = "inline")
#'
#' @export

useFireworks <- function(startOnLoad = TRUE){
  template.loc1 <- file.path(find.package(package = pkgn), "themes")
  css <- paste0(.packageName, ".css")
  js <- paste0(.packageName, ".js")

  if (interactive()) {
    # include scripts
    htmltools::htmlDependency(
      pkgn, vers,
      src = template.loc1,
      script = js,
      stylesheet = css,
      all_files = TRUE
    )
  } else {
    # fetch scripts
    fetch.css <- readLines(file.path(template.loc1, css))
    fetch.js <- readLines(file.path(template.loc1, js))

    # combine scripts
    combine.css.js <- c(
      "<", scr.elm[1], ">", fetch.css, "</", scr.elm[1], ">",
      "<", scr.elm[2], ">", fetch.js, "</", scr.elm[2], ">"
    )

    # collapse and set to html
    tear.combo <- paste(combine.css.js, collapse = "")
    # set to html
    attr(tear.combo, "html") <- TRUE
    class(tear.combo) <- c("html", "character")
    # display html
    return(tear.combo)
  }
}

scr.elm <- c("style", "script", "html")
pkgn <- .packageName
vers <- "0.1.0"


