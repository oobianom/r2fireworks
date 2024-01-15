# r2fireworks: Add festivities of fireworks to your Rmarkdown and Shiny application

### Official site: https://r2fireworks.obi.obianom.com

![](https://r2fireworks.obi.obianom.com/r2fireworks_out.gif)

### Installation and Library Attachment

The r2social package is available on CRAN and can be installed as shown below

`remotes::install_github("oobianom/r2fireworks")`

Attach library 

`library(r2social)`


### Shiny application

```{r}

library(shiny)
library(r2fireworks)


#ex 1 - to share various links
ui <- fluidPage(
 useFireworks(startOnLoad = TRUE)
)

#ex 2 - to link your page to specific domain online
ui <- fluidPage(
  
)


```

### Rmarkdown document

```{r}

library(r2fireworks)

useFireworks(startOnLoad = TRUE)



```
