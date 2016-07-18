
library(shiny)


# Returns a y values of gaussian curve based on x values
gaussian <- function(x, a, b = 75, c) {
  a * exp( -((x-b)^2 / (2 * c^2)) )
}

# Returns a sigmoid (or logistic) curve based on x values
sigmoid <- function(x, a=1, b=1, c=1) {
  a / ( 1 + exp(- b * ( x - c)))
}

# Combines the gaussian and sigmoid functions to make a simulated melt curve
meltCurve <- function(x, tm, height) {
  sig.height <- height / 7
  melt <- sig.height + sigmoid(x, -sig.height, 0.5, tm) + gaussian(x, height, tm, 1.5)
}

# Server code for shiny app
shinyServer(function(input, output) {
  
  output$meltPlot <- renderPlot({
    
    # Temp range from 60 to 90 C
    x <- seq(60,90,0.1)
    
    melt1 <- meltCurve(x, input$Tm1, input$PeakHeight1)
    melt2 <- meltCurve(x, input$Tm2, input$PeakHeight2)
    melt <- melt1 + melt2
    
    plot(melt ~ x, main="Melt Curve", xlab="Temp", ylab="Height")
  })
  
  output$meltCurve <- renderPlot({
    
    # Temp range from 60 to 90 C
    x <- seq(60,90,0.1)
    
    melt1 <- meltCurve(x, input$Tm1, input$PeakHeight1)
    melt2 <- meltCurve(x, input$Tm2, input$PeakHeight2)
    melt <- melt1 + melt2
    mc <- diffinv(-melt) - min(diffinv(-melt))
    
    plot(mc ~ x[1:length(mc)], main="Raw Melt", xlab="Temp", ylab="Height")
  })
  
})


