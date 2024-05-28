# create the card content -------------------------------------------------
first_card <-   
  div(
  align = "left",
  # img() # this is where you would add an image
  p("Story Header", style = "font-size: 17px; font-weight: 800;"),
  p("date"),
  actionLink("open_first_card", "This is the story title")
)




second_card <- card_function(link = "open_second_card")
third_card <- card_function(link = "open_third_card")
fourth_card <- card_function(link = "open_fourth_card")
fifth_card <- card_function(link = "open_fifth_card")
sixth_card <- card_function(link = "open_sixth_card")



# content for each story card ---------------------------------------------
card_data <- list(
  "story_one" = list(
    card = first_card,
    content =  
      div(
        p("this is the content"),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        p("Using spaces to demo the button that returns user to top of page")
      )
  ),
  "story_two" = list(
    card = second_card,
    content =  
      div(
        p("this is the content")
      )
  ),
  "story_three" = list(
    card = third_card,
    content =  
      div(
        p("this is the content")
      )
  ),
  "story_four" = list(
    card = fourth_card,
    content =  
      div(
        p("this is the content")
      )
  ),
  "story_five" = list(
    card = fifth_card,
    content =  
      div(
        p("this is the content")
      )
  ),
  "story_six" = list(
    card = sixth_card,
    content =  
      div(
        p("this is the content")
      )
  )
)
