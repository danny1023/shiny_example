library(shiny)
library(tidyverse)
library(gapminder)

#load('geocodedData.Rdata')

shinyServer(function(input,output){
  theData <- reactive({
    gapminder %>% filter(year >= input$year[1])
  })
  
  output$trend <- renderPlot({
    thePlot <- theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) + geom_line() + ggtitle('Graph to show life expectancy by continent over time')
    
    if(input$linear){
      thePlot <- thePlot + geom_smooth(method = 'lm')
    }
    
    print(thePlot)
  })
})