
server <- function(input, output) {
  
  compute<-reactive({
    unit<-as.numeric(input$slider)
    
    if(input$Conversion=="F2C"){
      answer<-(unit-32)*5/9
      return(answer)}
    else{
      answer<-(unit/5*9)+32
      return(answer)}
  })
  
  output$text1 <- renderText({
    if(input$Conversion=="F2C"){
    paste(input$slider,"Farenheit")
    }
    else{paste(input$slider,"degrees Celsius")}
    })
  
  
  output$text2<-renderText({
    
    if(input$Conversion=="F2C"){
      paste(compute(),"degrees Celcius")
    }
    else{paste(compute(),"degrees Celsius")}
  })
  
  output$plot1<-renderPlot({
    
    if(input$showplot){
    unit<-input$slider
    answer<-compute()
    
    if(input$Conversion=="F2C"){
      plot(answer,unit,xlab = "Degree Celcius",
           ylab="Farenheit",bty="n",pch=16,
           xlim=c(-20,110),ylim = c(0,220))
      lines(c(-17.77,100),c(0,212),col="blue",lwd=2)
      points(answer,unit,col="red",pch=16,cex=2)
      }
    
    else{
      plot(unit,answer,xlab = "Degree Celcius",
           ylab="Farenheit",bty="n",pch=16,
           xlim=c(-20,110),ylim = c(0,220))
      lines(c(-17.77,100),c(0,212),col="blue",lwd=2)
      points(unit,answer,col="red",pch=16,cex=2)
    }
    }
    
  })
  
}