# r2fireworks: Add/remove celebratory fireworks to your Rmarkdown and Shiny application

### Official site: https://r2fireworks.obi.obianom.com

![](https://r2fireworks.obi.obianom.com/r2fireworks_out.gif)

### Installation and Library Attachment

The r2social package is available on CRAN and can be installed as shown below

`remotes::install_github("oobianom/r2fireworks")`

Attach library 

`library(r2social)`


### Shiny application

```{r}
# simple example with automatic start
library(shiny)
library(r2fireworks)

ui <- fluidPage(
  useFireworks(),
  shiny::tags$h1("Introducing r2fireworks"),
  shiny::tags$p("Celebrate 4th of July and my R package!!!")
)
server <- function(input, output, session) {
# optional. start fireworks on load
  showFireworks(particleCount = 30)
}

shinyApp(ui, server)







# example with start and stop buttons
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

server <- function(input, output, session) {
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


```

### Rmarkdown document

```
  ---
  title: "r2fireworks: add celebratory fireworks to page"
  output:
    html_document:
      theme: default
  ---
  
  
  
  #### Example
  
  `\``{r}
  library(r2fireworks)
  useFireworks()
  addRmdFireworks(particleCount = 30, speed = 3)
  ```

```

```
