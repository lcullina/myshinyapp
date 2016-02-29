library(shiny)
library(forecast)

diabetesRisk <- function(glucose) glucose / 200
myforecast <- function(vect1) {
        ses(as.numeric(numextractall(vect1)))$mean[1]
}
myalpha <- function(vect1){
        ses(as.numeric(numextractall(vect1)))$model$par[1]
}

mylower <- function(vect1){
        ses(as.numeric(numextractall(vect1)))$lower[11]
}

myupper <- function(vect1){
        ses(as.numeric(numextractall(vect1)))$upper[11]
}

numextractall <- function(string){ # http://stackoverflow.com/questions/19252663/extracting-decimal-numbers-from-a-string
        unlist(regmatches(string,gregexpr("[[:digit:]]+\\.*[[:digit:]]*",string)), use.names=FALSE)
}

shinyServer(
        function(input, output){
                output$inputValue <- renderPrint({as.numeric(numextractall(input$vect1))})
                output$prediction <- renderPrint({myforecast(input$vect1)})
                output$alpha <- renderPrint({myalpha(input$vect1)})
                output$lowerbound <- renderPrint({mylower(input$vect1)})
                output$upperbound <- renderPrint({myupper(input$vect1)})
        }
)