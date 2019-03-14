library(shiny)
shinyUI(fluidPage(
    titlePanel('Minimal application'),
    sidebarLayout(
      sidebarPanel(
        textInput(inputId = 'comment', label = 'Say something?', value = '')
      ),
      mainPanel(
        h3('This is you saying it'),
        p('This is just for testing paragraph function'),
        textOutput('textDisplay')
      )
    )
))