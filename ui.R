library(shiny)
shinyUI(
        pageWithSidebar(
                
        headerPanel("SES Forecast Calculator"),
        
        sidebarPanel(
                textInput('vect1', 'Enter comma-separated historical data here:', value = "0"),
                
                #checkboxGroupInput("id2","Checkbox",
                #                  c("Value 1" = "1",
                #                     "Value 2" = "2",
                #                     "Value 3" = "3")),
                
                submitButton('Submit')
        ),
                #dateInput("date", "Date:")
                
        mainPanel(
                h3('Result of prediction'),
                h4('You entered'),
                verbatimTextOutput("inputValue"),
                h4('Which resulted in a prediction of '),
                verbatimTextOutput("prediction"),
                h4('With a 95% confidence interval between '),
                verbatimTextOutput("lowerbound"),
                verbatimTextOutput("upperbound"),
                h4('Your optimized alpha value is '),
                verbatimTextOutput("alpha")
                
                )
        )
)