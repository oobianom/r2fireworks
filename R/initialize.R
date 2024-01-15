#' Set up firework scripts and loader
#'
#' Calls to load fireworks to a page
#'
#'
#' @section Examples for r2fireworks:
#' More examples and demo pages are located at this link -
#' \url{https://r2fireworks.obi.obianom.com}.
#'
#' @return scripts to load fireworks and trigger to start fireworks
#'
#' @examples
#' if(interactive()){
#' # example 1: simple example with automatic start
#' library(shiny)
#' library(r2fireworks)
#'
#' ui <- fluidPage(
#'   useFireworks(),
#'   shiny::tags$h1("Introducing r2fireworks"),
#'   shiny::tags$p("Celebrate 4th of July and my R package!!!")
#' )
#' server <- function(input, output, session) {
#'   # optional. start fireworks on load
#'   showFireworks(particleCount = 30)
#' }
#'
#' shinyApp(ui, server)
#'
#'
#'
#'
#'
#'
#'
#' # example 2: sample with start and stop buttons
#' library(shiny)
#' library(r2fireworks)
#'
#' ui <- fluidPage(
#'   useFireworks(),
#'   shiny::tags$h1("Here is the starts"),
#'   shiny::tags$p("Celebrate 4th of July and my R package!!!"),
#'   actionButton("startFW","Show and Start Fireworks, with speed x1"),
#'   actionButton("startFWx4","Show and Start Fireworks, with speed x4"),
#'   actionButton("startFWspx4","Show Fireworks, with particle burst size 10000"),
#'   actionButton("stopFW","Remove Fireworks")
#' )
#'
#' server <- function(input, output, session) {
#'   observeEvent(input$startFW,{
#'     showFireworks()
#'   })
#'
#'   observeEvent(input$startFWx4,{
#'     showFireworks(speed = 4,particleCount = 50)
#'   })
#'
#'   observeEvent(input$startFWspx4,{
#'     showFireworks(speed = 1,particleCount = 10000)
#'   })
#'   observeEvent(input$stopFW,{
#'     removeFireworks()
#'   })
#' }
#'
#' }

#'
#' @export

useFireworks <- function(){
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
vers <- "1.1.0"



