# Logging Events in Shiny Apps • shinyEventLogger

![rw-book-cover](https://readwise-assets.s3.amazonaws.com/static/images/article0.00998d930354.png)

## Metadata
- Author: 
- Full Title: Logging Events in Shiny Apps • shinyEventLogger
- Category: #articles
- URL: https://kalimu.github.io/shinyEventLogger/index.html

## Highlights
- Simple app logging different events to R console, browser JavaScript console and to a file.
  shinyEventLogger::run_demo()
- Dashboard that allows for interactive analysis of events from demo app.
  shinyEventLogger::run_demo_dashboard()
- library(shiny)
  library(shinyEventLogger)
  set_logging()
  shinyApp(
  ui = fluidPage(log_init()),
  server = function(input, output) {
  set_logging_session()
  log_event("Hello World")
  }
  )
- For other logging packages see: https://github.com/daroczig/logger
