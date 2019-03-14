library(shiny)
library(gapminder)
library(tidyverse)
library(ggmap)

if(!file.exists("geocodedData.Rdata")){

  mapData = gapminder %>%
    mutate(country2 = as.character(country)) %>%
    group_by(country) %>%
    slice(1) %>%
    mutate_geocode(country2, source = "dsk") %>%
    select(-country2)

  mapData = left_join(gapminder, mapData) %>%
    group_by(country) %>%
    fill(lon) %>%
    fill(lat)

  save(mapData, file = "geocodedData.Rdata")

} else {

  load("geocodedData.Rdata")
}
# load("geocodedData.Rdata")

shinyServer(function(input, output){
  output$plotDisplay <- renderPlot({
    gapminder %>% filter(country == input$country) %>% ggplot(aes(x = year, y = lifeExp)) + geom_line()
  })
  
  output$outputLink <- renderText({
    link = 'https://en.wikipedia.org/wiki/'
    paste0('<form action="', link, input$country, '">
           <input type="submit" value = "Go to Wikipedia">
           </form>')
  })
})