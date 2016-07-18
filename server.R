
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


# Returns a y values of gaussian curve based on x input
gaussian <- function(x, a, b = 75, c) {
  a * exp( -((x-b)^2 / (2 * c^2)) )
}

sigmoid <- function(x, a=1, b=1, c=1) {
  a / ( 1 + exp(- b * ( x - c)))
}

meltCurve <- function(x, tm, height) {
  sig.height <- height / 7
  melt <- sig.height + sigmoid(x, -sig.height, 0.5, tm) + gaussian(x, height, tm, 1.5)
}

shinyServer(function(input, output) {
  
  output$meltPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- seq(60,90,0.1)
    
    melt1 <- meltCurve(x, input$Tm1, input$PeakHeight1)
    melt2 <- meltCurve(x, input$Tm2, input$PeakHeight2)
    melt <- melt1 + melt2
    plot(melt ~ x, main="Melt Curve", xlab="Temp", ylab="Height")
    
  })
  
  output$meltCurve <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x <- seq(60,90,0.1)
    
    melt1 <- meltCurve(x, input$Tm1, input$PeakHeight1)
    melt2 <- meltCurve(x, input$Tm2, input$PeakHeight2)
    melt <- melt1 + melt2
    mc <- diffinv(-melt) - min(diffinv(-melt))
    
    plot(mc ~ x[1:length(mc)], main="Raw Melt", xlab="Temp", ylab="Height")
  })
  
})


