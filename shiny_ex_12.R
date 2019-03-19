library(shiny)

server <- function(input, output){
  output$table <- renderTable({
    head(iris)
  })
}

ui <- splitLayout(
  #从左到右固定宽度罗列，宽度可修改
  cellWidths = c('20%', '20%', '60%'),
  sliderInput('slider', 'Slider', min = 1, max = 100, value = 50),
  textInput('text', 'Text'),
  tableOutput('table')
)

shinyApp(ui, server)