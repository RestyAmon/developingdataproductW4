library(shiny)

shinyUI(fluidPage(
  titlePanel("Temperature Unit Converter limited to Farenheit and Celcius"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Conversion", "Choose the conversion type you want to perform",
                  c("Farenheit to Celsius" = "F2C",
                    "Celsius to Farenheit" = "C2F")),
      sliderInput("slider","Slide the number you want to convert",0,100,value=20),
      checkboxInput("showplot","Place a tick if you want to show the temperature plot",value = T),
      h5("Click submit button to run the app"),
      submitButton("submit") #NEW
      
      
    ),
    mainPanel(
      plotOutput("plot1"),
      h4("You want to convert"),
      textOutput("text1"),
      h4("You convert it to"),
      textOutput("text2"),
      h4("=========================================="),
      h5("You can access the code through this link"),
      a("https://github.com/RestyAmon/developingdataproductW4")
            
      
    )
  )
))