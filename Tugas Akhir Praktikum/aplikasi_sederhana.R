


########################################
########UI (User Interface)#############
########################################

aplikasi_sederhana_ui <- function(id) {
  
  
  
  ns <- NS(id)
  
  fluidPage(
    
    
    tabPanel("Upload Your Data",
             
             
             sidebarPanel(
               
               fileInput(ns("ambil_file_data"), "Choose .txt/.csv File",
                         accept = c(
                           "text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")
                         
               ),
               
               
               
               radioButtons(ns("pemisah_variabel"), "Separator",
                            choices = c(Comma = ",",
                                        Semicolon = ";",
                                        Tab = "\t"),
                            selected = ",", inline = TRUE),
               
             ),
             
             
             mainPanel(
               DT::DTOutput(ns("mydata")),
               
             ),
             
             
             br()
    ),
    
    
    
    
    
    br()
    
  )
  
  
} #Akhir dari UI

















































########################################
################Server##################
########################################



aplikasi_sederhana_server <- function(input, output, session) {
  


  
  
  
  
  
  output$mydata <- DT::renderDT({
    
    ambil_file_data <- input$ambil_file_data
    
    if(is.null(ambil_file_data))
      return(NULL)
    
    read.csv(ambil_file_data$datapath, sep = input$pemisah_variabel)
    
    
  })
  
  
  
  
  
  
  
  
  
  
  

} #akhir dari server











