



library(shiny)



ui <- fluidPage(
                
  
  
  h2("Aplikasi Upload Data - Tugas Akhir Praktikum Data Analitik", style="
    font-family: 'cursive';
    color: #ad1d28;
    font-size:50px;
    font-weight: bold; 
    text-align:center
    
    "),
  
  HTML('<center><img src="rshiny.png" width="150"></center>'),
  
  
  h2("Chintya Maharani - 065002000029", style="
    font-family: 'cursive';
    color: #ad1d28;
    font-size:30px;
    text-align:center
    
    "),
  
  
  
  HTML('<center><img src="tya.jpg" width="150"></center>'),
  
  
  
  
  
  
               
  uiOutput("aplikasi_sederhana"),
                
                
                br()
                
) #Akhir dari UI