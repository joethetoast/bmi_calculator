library(shiny)

# I got my formula for calculating BMI from this webpage:
# http://www.wikihow.com/Calculate-Your-Body-Mass-Index-(BMI)

shinyServer(function(input, output) {
  output$bmi <- renderPrint({
    inches <- (input$height_feet * 12) + input$height_inches
    weight <- input$weight
    conversion_const = 703
    bmi <- (weight / (inches^2)) * conversion_const
    
    bmi
  })
  
  output$bmi_reference <- renderTable({
    ref <- data.frame(
      c(
        'Underweight',
        'Normal Weight',
        'Overweight',
        'Obese'
      ),
      c(
        '< 18.50',
        '18.50 - 24.99',
        '>= 25',
        '>= 30'
      )
    )
    colnames(ref) <- c('Description', 'BMI Measurement')
    
    ref
  })
})