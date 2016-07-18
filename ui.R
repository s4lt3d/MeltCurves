
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Melt Curve with two peaks"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("PeakHeight1",
                  "Height of melt peak 1:",
                  min = 1,
                  max = 50,
                  value = 15),
      sliderInput("Tm1",
                  "Tm of peak 1:",
                  min = 60,
                  max = 90,
                  value = 77,
                  step=0.5),
      sliderInput("PeakHeight2",
                  "Height of melt peak 2:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("Tm2",
                  "Tm of peak 2:",
                  min = 60,
                  max = 90,
                  value = 82,
                  step=0.5)
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("meltPlot"),
      plotOutput("meltCurve")
    )
  )
))
