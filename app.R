# example of stories used in the ASTHO Profile dashboard
# www.astho.org/profile




library(shiny)
library(bslib)
library(shinyjs)
library(htmltools)

source("R/func.R")
source("R/stories.R")




custom_theme <- bs_theme(
  version = 5,
  bg = "#f4ede1",
  fg = "#000000",
  primary = "#1f2d57",
  secondary = "#7ca0d1",
  base_font = "Roboto"
)


ui <- fluidPage(
  
  useShinyjs(),
  
  # these are all for the side button on the stories page
  # that take the user back to the top of the page
  tagList(
    tags$style(type='text/css', 
               ".sideButton {
                border-color: #C65227;
                border-radius: 0px;
                padding: 5px;
                border-width: 1px solid;
                text-transform: none;
                box-shadow: none;
                height: 40px;
                width: 40px;}"
    ),
    
    tags$style(type='text/css', 
               "#fixed_button {
                position: fixed;
                top: 55%;
                font-weight: normal;
                right: 1%;
                }"
    )
  ),
  
  
  theme = custom_theme,
  
  tabPanel(
    "Data Stories", 
    value = "stories",
    br(),
    br(),
    div(
      align = "center",
      uiOutput("cards_output")
    ),
    div(
      uiOutput("full_page_content")
    )
  ) #closes the tabPanel
  
  
)




# Server ====================================================================

server <- function(input, output) {
  

# function ----------------------------------------------------------------
  # when selected, "open" the card
  my_story_card <- function(input_id, card) {
    
    card_content(card_data[[input_id]]$content)

    updateNavbarPage(inputId = "astho-main",
                     selected = "stories")
  }
  
  
  
# value for card content --------------------------------------------------
  card_content <- reactiveVal(NULL)

  
  
# events to "open" the card -----------------------------------------------
  observeEvent(input$open_first_card, my_story_card("story_one"))
  observeEvent(input$open_second_card, my_story_card("story_two"))  
  observeEvent(input$open_third_card, my_story_card("story_three"))  
  observeEvent(input$open_fourth_card, my_story_card("story_four"))  
  observeEvent(input$open_fifth_card, my_story_card("story_five"))  
  observeEvent(input$open_sixth_card, my_story_card("story_six"))  
  
  

# back button scroll to top -----------------------------------------------
  observeEvent(input$back_btn, {
    shinyjs::runjs("window.scrollTo(0, 0)") 
  })
  
  
  
# display the cards -------------------------------------------------------
  output$cards_output <- renderUI({
    
    # if no card is selected, the "cards" will display
    if (is.null(card_content())) {
      div(
        class = "storyNoColor12",
        style = "padding-left: 20px;",
        
        # top row to include header
        div(
          class = "row",
          div(
            class = "col-lg-6",
            align = "left",
            br(),
            h1(strong("Data Stories Landing"), style = "font-size: 60px;"),
            p("Description here about the data stories or how to use this page"),
            br(),
            hr()
          ),
          div(
            class = "col-lg-6",
          )
        ),
        br(),
        br(),
        br(),
        
        # first row of cards
        div(
          class = "row",
          div(
            class = "col-xl-4",
            first_card # card
          ),
          div(
            class = "col-xl-4",
            second_card # card
          ),
          div(
            class = "col-xl-4",
            third_card # card
          )
        ),
        br(),
        br(),
        
        # second row of cards
        div(
          class = "row",
          div(
            class = "col-xl-4",
            fourth_card
          ),
          div(
            class = "col-xl-4",
            fifth_card
          ),
          div(
            class = "col-xl-4",
            sixth_card
          )
        ),
        br(),
        br()
      )
    }
  })
  
  
  # display card content upon selection -------------------------------------
  output$full_page_content <- renderUI({
    
    if (!is.null(card_content())) {
      
      div(
        actionLink("back_to_stories", "Back to Stories"), # takes user back to stories
           
        p(card_content()),
        div(
          actionButton( # this sends you back to the top
            "back_btn", 
            "",
            icon = icon("arrow-up"), 
            class = "side_button"
          ),
          id = "fixed_button"
        )
      )
    }
  })  
  
  
  # reset card content ------------------------------------------------------
  observeEvent(input$back_to_stories, {
    card_content(NULL) # Reset the selected card content
  })  
  
  
} #closes the server



# Run the application 
shinyApp(ui = ui, server = server)

