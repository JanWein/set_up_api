library(plumber)
library(tidyquant)
library(tibble)
library(magrittr)
library(dplyr)
library(lubridate)
library(plumberDeploy)

#* @apiTitle Stock Market Data API
#* @apiDescription Example of how to setup a Plumber API with just a few lines of code

#* Provide Stock Market Returns
#* @param symbol Ticker symbol (e.g. 'googl' for Alphabet, 'amzn' for Amazon ...)
#* @param from start date for the time series in 'YYYY-MM-DD' format. If not provided the start date is today minus 1 month. 
#* @param to end date for the time series in 'YYYY-DD-DD' format. If not provided, the end date is today.
#* @get /return
#* @serializer csv
financial_data <- function(symbol,from = today()-months(1),to = today()) {
  data <- tq_get(x = symbol, 
                 get = "stock.prices",
                 from = from,
                 to   = to)  %>% 
    arrange(date=desc(date))
  data 
}
















#analogsea::account()
#analogsea::key_create
#analogsea::droplets()
#mydrop <- plumberDeploy::do_provision()
#analogsea::install_r_package(mydrop)
