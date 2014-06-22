
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

variables <- names(iris)[1:length(names(iris))-1]


shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Explore random number generation and it's distribution"),
  
  sidebarPanel(
    h3("Random sample parameters:"),
    p("This simple application lets you generate a random sample, normally distributed,
      and see the result as an histogram of probabilities.
      You can control the sample size (n), the sample mean (mu) and the sample standard
      deviation (std). You will see how this parameters affect the sample."),
    
    sliderInput("n", "Sample size (n)", 500, min = 10, max = 1000, step = 10),
    sliderInput("mean", "Sample mean (mu)", 0, min = -10, max = 10, step = 1),
    sliderInput("std", "Sample standard deviation (std)", 1, min = 0, max = 5, step = 0.1),
    
    h3("Fitting curve parameters:"),
    p("In this section (Fitting curve) you can control how a curve is fitted to the
      sampled data (generated from the above parameters)."),
    
    numericInput("adjust", "Sample standard deviation (adjust)", 1, min = 1, max = 30, step = 1)    
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    verbatimTextOutput("input"),
    plotOutput("plot")
  )
))

