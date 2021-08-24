#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

Coefficients <- read_excel(
    "Liu et al. (2000).xlsx",
    sheet = "Coefficients",
    col_types = c(
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric",
        "numeric"
        )
    )

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Example for Liu et al. 2020"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput(
                "Milking time",
                "Milking time (HH:mm)"
            ),
            textInput(
                "PreviousMilkingTime",
                "Previous milking time (HH:mm)"
            ),
            textInput(
                "MilkYield",
                "Milk yield (kg)",
                value = "20"
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = as.numeric(input$MilkYield) + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}



# Run the application
shinyApp(ui = ui, server = server)



