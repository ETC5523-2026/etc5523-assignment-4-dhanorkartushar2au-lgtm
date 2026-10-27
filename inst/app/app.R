library(shiny)
library(ggplot2)

penguins <- penguinscope::penguins

measure_choices <- c(
  "Body mass (g)"       = "body_mass_g",
  "Flipper length (mm)" = "flipper_length_mm",
  "Bill length (mm)"    = "bill_length_mm",
  "Bill depth (mm)"     = "bill_depth_mm"
)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5, bootswatch = "flatly"),
  titlePanel("Penguinscope: exploring Palmer penguin sizes"),
  
  wellPanel(
    strong("For:"),
    "someone new to the Palmer Penguins data who wants to see how the three species differ in size.",
    br(),
    strong("Question:"),
    em("How do penguin body measurements differ across species, and does that depend on the island or the penguin's sex?")
  ),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("measure", "Measurement to compare",
                  choices = measure_choices, selected = "body_mass_g"),
      checkboxGroupInput("species", "Species (tick to include)",
                         choices = levels(penguins$species),
                         selected = levels(penguins$species)),
      checkboxGroupInput("island", "Island",
                         choices = levels(penguins$island),
                         selected = levels(penguins$island)),
      checkboxGroupInput("sex", "Sex",
                         choices = levels(penguins$sex),
                         selected = levels(penguins$sex)),
      helpText(
        "Measurement: choose which body measurement to compare. ",
        "Species / Island / Sex: tick to include a group, untick to remove it. ",
        "The plot and table update to the penguins you select. ",
        "Note: Gentoos live only on Biscoe and Chinstraps only on Dream, ",
        "so some combinations have no penguins."
      )
    ),
    mainPanel(
      h4("Distribution across species"),
      plotOutput("plot"),
      helpText("Each box shows the middle half of the penguins; the line is the median. ",
               "Higher boxes mean larger penguins for the chosen measurement."),
      h4("Group summary"),
      tableOutput("table"),
      textOutput("interpretation")
    )
  )
)

server <- function(input, output, session) {
  
  filtered <- reactive({
    penguins[penguins$species %in% input$species &
               penguins$island  %in% input$island  &
               penguins$sex     %in% input$sex, , drop = FALSE]
  })
  
  measure_label <- reactive({
    names(measure_choices)[measure_choices == input$measure]
  })
  
  output$plot <- renderPlot({
    validate(need(nrow(filtered()) > 0,
                  "No penguins match this selection. Add a species, island or sex to see results."))
    ggplot(filtered(),
           aes(x = species, y = .data[[input$measure]], fill = sex)) +
      geom_boxplot(alpha = 0.85) +
      labs(x = "Species", y = measure_label(), fill = "Sex") +
      theme_minimal(base_size = 14)
  })
  
  output$table <- renderTable({
    validate(need(nrow(filtered()) > 0, "No penguins to summarise."))
    penguinscope::summarise_penguins(filtered(), input$measure, "species")
  }, digits = 1)
  
  output$interpretation <- renderText({
    req(nrow(filtered()) > 0)
    s <- penguinscope::summarise_penguins(filtered(), input$measure, "species")
    top <- as.character(s$species[which.max(s$mean)])
    paste0("For the penguins you've selected, ", top,
           " has the highest average ", tolower(measure_label()),
           ". Compare the means and the sd (spread) across species to see how ",
           "clearly they differ on this measurement.")
  })
}

shinyApp(ui, server)