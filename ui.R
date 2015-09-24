
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Savings planning"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
      sliderInput("age",   "Your age today:", min = 18, max = 65, value = 40),
      sliderInput("retirement","Retirement Age", min = 55, max = 85, value = 65),
      sliderInput("death", 'Age at which you "plan" to die:', min = 65, max = 150, value = 85),
      sliderInput("savings", "Monthly savings (in 2015 USD)", min = 100, max = 10000, value = 1000, step = 100, pre = "$", sep = ","),
      sliderInput("annual_return", "Annual return of savings (%)", min = 0.0, max = 30.0, value = 3.0, step = 0.5),
      sliderInput("inflation","Mean inflation rate (%)", min = 0.0, max = 30.0, value = 1.0, step = 0.5),
      sliderInput("expenses", "Monthly expenses (in 2015 USD)", min = 500, max = 100000, value = 2000, step = 1000, pre = "$", sep = ",")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot"),
    h2("How to use this application:"),
    p("This simulator helps you to understand the power of compounding."),
    p("\"You should start saving as early as possible!\" \
      You have always heard this, and this calculator helps you understanding why. \
      Start by entering your age today, the age at which you would like to retire and \
      for the sake of it, the age at which you'd like to die (you will, eventually)."),
    p("In Monthly Saving set the amount that you can put aside on your savings account every month.\
       This amount should be expressed in 2015 USD, i.e. adjusting for inflation you will
       save in the future the equivalent 'buying power' of today's saving amount."),
    p("Next define the return rate of your planned savings. Unless you are Buffet, be conservative."),
    p("Enter next a mean inflation rate through your life time"),
    p("Last, think of how much in today's terms, you would like to be able to spend while in retirement."),
    p("Now, start saving! Notice that the calculations are performed with very gross approximations, so the risk is on you.")
  )
))
