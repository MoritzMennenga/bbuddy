#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



shinyUI( bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("mymap", width = "100%", height = "100%"),
  absolutePanel(top = 10, right = 10,
                sliderInput("datetime",
                            "Dates:",
                            min = as.Date(mindate,"%Y-%m-%d"),
                            max = as.Date(maxdate,"%Y-%m-%d"),
                            value=as.Date(maxdate),
                            timeFormat="%Y-%m-%d", 
                            step = 1,
                            animate = F),
                selectInput("select_species", "Species", choices = species_names,selected = species_names[1])
  )
))
