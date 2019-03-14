library(shiny)
server <- function(input, output) {
  output$textDisplay <- renderText({
    paste0("You said '", input$comment, "'. There are ", nchar(input$comment), ' characters in this.')
  })
}

ui <- fluidPage(
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
)

shinyApp(ui = ui, server = server)