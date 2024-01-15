#' Widget to initiate or terminate fireworks display
#'
#' Add or remove fireworks graphics from page
#'
#' @param type type of action e.g start, remove
#' @param duration duration of fireworks outbursts
#' @param speed speed of display of fireworks
#' @param particleCount particle size of fireworks
#' @param session session object from server
#' @return inclusion or exclusion of fireworks from page
#' @rdname fireworkMessenger
#' @export

fireworkMessenger <- function(type,duration=NULL,speed=NULL, particleCount = 30, session = getDefaultReactiveDomain()){
  if(!is.null(duration)) warning("argument is still being developed. check next version")
  session$sendCustomMessage("fwstatus598", list(
    what = type,
    duration = duration,
    speed = speed,
    particleCount = particleCount
  ))
}


#' Display fireworks on page
#'
#' Add fireworks visuals to page
#' @return visible firework canvas on the page
#' @rdname fireworkMessenger
#' @export

showFireworks <- function( speed = 1, particleCount = 40, session = getDefaultReactiveDomain()){
  fireworkMessenger(type = "start", speed = speed, particleCount = particleCount)
}


#' Remove fireworks on page
#'
#' Remove fireworks visuals from page
#'
#' @return removal of firework canvas from the page
#' @rdname fireworkMessenger
#' @export

removeFireworks <- function(session = getDefaultReactiveDomain()){
  fireworkMessenger(type = "remove")
}


#' Add fireworks on Rmarkdown page
#'
#' Add fireworks visuals to Rmarkdown page
#'
#' @return addition of firework canvas on the page
#' @rdname fireworkMessenger
#'
#' @examples
#' # In R markdown documents
#' library(r2fireworks)
#' useFireworks()
#' addRmdFireworks(particleCount = 100, speed = 3)
#'
#' @export

addRmdFireworks <- function(speed = 1, particleCount = 40){
  stopifnot(speed > 0)
  return(htmltools::HTML(
    paste0("<script>
    var isRmd = true;var isRmdspeed = ",speed,";var isRmdpc = ",particleCount,"
      </script>"
  )))
}
