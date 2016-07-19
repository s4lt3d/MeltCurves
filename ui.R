# A simple toy to learn about melt curves and how they interact. 

library(shiny)


shinyUI(fluidPage(

  titlePanel("Melt Curve with two peaks"),

  # Sidebar with sliders for input values for the two melt curves
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
                  step=0.5),
      sliderInput("PeakHeight3",
                  "Height of Reference Peak:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("Tm3",
                  "Tm of Reference Peak:",
                  min = 60,
                  max = 90,
                  value = 82,
                  step=0.5)
    ),

    # Plot the melt curve and the simulated raw curve
    mainPanel(
      plotOutput("meltPlot"),
      plotOutput("meltCurve"),
      plotOutput("meltDiff")
    )
  )
))

# needed to run the app from code

#runApp(port=80)#, host=getOption("shiny.host", "0.0.0.0")) 
