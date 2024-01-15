library(shiny)
library(r2fireworks)

ui <- fluidPage(
  useFireworks(),

  shiny::tags$h1("Here is the starts"),
  shiny::tags$p("Celebrate 4th of July and my R package!!!"),
  actionButton("startFW","Show and Start Fireworks, with speed x1"),
  actionButton("startFWx4","Show and Start Fireworks, with speed x4"),
  actionButton("startFWspx4","Show Fireworks, with particle burst size 10000"),
  actionButton("stopFW","Remove Fireworks")
)
