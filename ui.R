shinyUI(pageWithSidebar(
  headerPanel("Know your Body Mass Index (BMI)"),
  sidebarPanel(
   
    numericInput('weight', 'Weight in kg', value = 0, min = 0),
    numericInput('height', 'Height in cm', value = 0, min = 0),
    
    submitButton("Get your BMI!")
  ),
  mainPanel(
    helpText('This page will help you calculate your BMI that is based on Asian stangards. These are health indicator for people aged 18 and above. 
             If your BMI is 23 and above, your weight is outside the healthy weight range for your height.'),
    helpText('To begin, enter your Weight and Height in the fields provided on the left and click on the "Get your BMI!" button.'),
    uiOutput("input"),
    h4 ("Results: "),
    uiOutput("result")    
  )
))