server <- function(input, output, session) {

  # start fireworks on load
  showFireworks(particleCount = 30)

  observeEvent(input$startFW,{
    showFireworks()
  })

  observeEvent(input$startFWx4,{
    showFireworks(speed = 4,particleCount = 50)
  })

  observeEvent(input$startFWspx4,{
    showFireworks(speed = 1,particleCount = 10000)
  })
  observeEvent(input$stopFW,{
    removeFireworks()
  })
}
