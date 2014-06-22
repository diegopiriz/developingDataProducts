
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  
  sample <- reactive(rnorm(input$n, input$mean, input$std))
  
  output$input <- renderPrint(cat(
    "Sample size:",input$n, 
    "Sample mean:",input$mean, 
    "Sample std:",input$std, 
    "Fitting model adjust:",input$adjust))
  
  output$plot <- renderPlot({
    hist(sample(), prob=T, breaks=100, col="green", main="Generated sample and fitted model", ylab="Probability", xlab="Value")
    lines(density(sample(), adjust=input$adjust), col="blue", lwd=2)
  })
  
})
