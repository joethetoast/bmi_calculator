library(shiny)

shinyUI(fluidPage(
  titlePanel('Calculate Your BMI'),
  
  p('Body Mass Index (BMI) is a calculation that attempts to tell you if you are underweight or overweight
    for your height. It can be calculated from your height and weight alone.'),
  p('In the boxes on the left below, please enter your height (in feet and inches) and your weight. On the right,
    you will see your calculated BMI measurement.'),
  
  sidebarLayout(
    sidebarPanel(
      h4('Your Height'),
      numericInput('height_feet',
                   label=p('Feet'),
                   value='',
                   min=2,
                   max=10),
      numericInput('height_inches',
                   label=p('Inches'),
                   value='',
                   min=1,
                   max=12),
      h4('Your Weight'),
      numericInput('weight',
                   label=p('Weight'),
                   value='',
                   min=0,
                   max=1000)
    ),
    
    mainPanel(
      h3('Your BMI is:'),
      h2(textOutput('bmi')),
      
      wellPanel(
        h5('BMI Reference'),
        tableOutput('bmi_reference'),
        p('More detailed info about what the BMI number indicates can be found ',
          a('here', href='http://apps.who.int/bmi/index.jsp?introPage=intro_3.html')
        )
      )
    )
  )
))