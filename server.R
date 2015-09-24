
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
library(shiny)
library(scales)
library(ggplot2)

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({

    # Compare age with retirement age
     validate(
          need(input$retirement > input$age, "Simulator only works if you are not yet in retirment")
     )

    # Compare retirement age with death
     validate(
          need(input$death > input$retirement, "Simulator only works if you die after retiring")
     )
      
    # Initialize saving for each year alive
    m <- matrix(12*input$savings,input$death-input$age)
    
    # Update the savings while working
    for (j in input$age:(input$retirement-1)) {
        m[j-input$age+2, ] = m[j-input$age+1, ]*(1+(input$annual_return)/100) +m[j-input$age+2,]*(1+input$inflation/100)^(j-input$age)
    }

    # Update withdraws during retirement
    for (j in input$retirement:(input$death-2)) {
        m[j-input$age+2, ] = m[j-input$age+1, ]*(1+(input$annual_return)/100) -12*(input$expenses*(1+input$inflation/100)^(j-input$age))
    }

    # Plot chart
    qplot(x=c(input$age:(input$death-1)),y=m[,1])+geom_line()+scale_y_continuous(labels = comma)+labs(title='Savings',x='Age',y='Wealth ($)')

    })
})
