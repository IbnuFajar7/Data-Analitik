



server <- function(input, output) {
  
  

  
  
  output$aplikasi_sederhana <- renderUI({
    
    
    
    source("module//aplikasi_sederhana.R")
    callModule(module = aplikasi_sederhana_server, id = "aplikasi_sederhana")
    aplikasi_sederhana_ui(id = "aplikasi_sederhana")
    
      
  
  })
  
  
  
  
  
  
  
  
  
  
  
} #Akhir dari server