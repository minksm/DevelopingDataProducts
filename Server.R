shinyServer(
  function(input, output) {
    
    output$input <- renderText({      
      paste0("<br>You are "," <strong>",input$weight, " kg", " @ ", input$height, " cm", "</strong><br><br>")
    })
    
    output$result <- renderText({
      if (input$weight == 0|input$height==0){
        bmic=0
      }
      else{
      bmic = as.integer(input$weight)/(as.integer(input$height)^2)*10000
      }  
      
      if (bmic<18.5) info = "<span style='color: green'> Your BMI is in the Low Risk category for cardiovascular diseases and type 2 diabetes. However, your weight is in the unhealthy range for your height as you are at an increased risk of nutritional deficiencies and osteoporosis. Increase your BMI value to within 18.5 to 22.9 to stay healthy.</span>"
      else if (bmic>=18.5 & bmic<22.9) info = "<span style='color: green'> Your BMI is in the Low Risk category. Your weight is in the healthy range for your height. Maintain your BMI value within 18.5 to 22.9 to stay healthy.</span>"
      else if (bmic>=23 & bmic<27.4) info = "<span style='color: orange'>Your BMI is in the Moderate Risk category. Your weight is in the unhealthy range for your height. You are at moderate risk of developing cardiovascular diseases (such as heart attack) and diabetes. Keep your BMI value within 18.5 to 22.9 to reduce your risk of developing these diseases.</span>"
      else if (bmic>=27.5) info ="<span style='color: red'>Your BMI is in the High Risk category. Your weight is in the very unhealthy range for your height. You are at high risk of developing cardiovascular diseases (such as heart attack) and diabetes. Keep your BMI value within 18.5 to 22.9 to reduce your risk of developing these diseases. </span>"
     
      if (bmic==0) paste0("-")
      else
        paste0("Your BMI is ", "<strong>", round(bmic, 2), "</strong>", ".<br><br>", "Information: <br>", info)
      
    })
  }
)