
# functions ---------------------------------------------------------------

# content to show under the actual card
card_function <- function(
    story_header = "Data Story",
    date = "date",
    link,
    title = "This is the title of the story") {
  
  div(
    align = "left",
    # img() # this is where you would add an image
    p(story_header, style = "font-size: 17px; font-weight: 800;"),
    p(date),
    actionLink(link, title)
  )
}
