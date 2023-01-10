#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
  
  ##Vogel und Zeitfilter
  
  

  
  dataset_show <- reactive({
    ds <- dataset[dataset$timestamp == input$datetime[1],]
    ds <- ds[ds$species_name == input$select_species,]
    return(ds)
  })
  

  output$mymap <- renderLeaflet({
    leaflet(dataset) %>%
      addMapPane("overlay", zIndex = 1000) %>%
      addMapPane("openstreetmap", zIndex = 1) %>%
      addProviderTiles(providers$OpenStreetMap.Mapnik,
                       options = providerTileOptions(noWrap = TRUE, pathOptions(pane = "openstreetmap"))
      ) %>%
      addDrawToolbar(
        targetGroup='draw',
        polylineOptions =FALSE,
        circleOptions = FALSE,
        polygonOptions  = FALSE,
        markerOptions = FALSE,
        circleMarkerOptions = FALSE,
        editOptions = editToolbarOptions(selectedPathOptions = selectedPathOptions())) %>%
      setView( lng =   9.08,
               lat =  52.84,
               zoom = 7
      )
  
  })
  
  observe({
    leafletProxy("mymap", data = dataset_show()) %>%
      clearMarkers() %>%
      addCircleMarkers(data = dataset_show(),  ~anonymized_longitude, ~anonymized_latitude, fillColor= 'goldenrod', color = 'blue',weight =1, fillOpacity = 1, stroke = T)
  }) 
  
 
  
  })
