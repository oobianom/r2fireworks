library(shiny)
library(r2fireworks)


ui <- fluidPage(
  useFireworks(),
  shiny::tags$h1("Here is the start"),
  HTML('
       <div id="underfireworkskit00056"><canvas id="canvas">Canvas is not supported in your browser.</canvas></div>
       '),
  shiny::tags$p("
  Celebrate 4th of July and my R package!!!
         Mi ipsum faucibus vitae aliquet nec ullamcorper. Netus et malesuada fames ac turpis egestas integer eget. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Mauris vitae ultricies leo integer malesuada nunc vel risus. Mauris a diam maecenas sed enim ut sem. Ac tortor dignissim convallis aenean. Eget nulla facilisi etiam dignissim. Donec ultrices tincidunt arcu non. Quis vel eros donec ac odio tempor orci dapibus. Cras tincidunt lobortis feugiat vivamus at augue eget arcu dictum.</div>
         ")
)
