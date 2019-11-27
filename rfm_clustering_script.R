library(tidyverse)
library(rfm)

analysis_date <- lubridate::as_date('2007-01-01', tz = 'UTC')

rfm_result <- rfm_table_customer(raw_data, 
                                 customer_id, 
                                 number_of_orders,
                                 recency_days, 
                                 revenue, 
                                 analysis_date)

rfm_result$rfm %>% 
  mutate_if(is.numeric, as.numeric) -> tabel_rfm

hasil <- data.frame(c(raw_data), 
                    recency_score = format(round(tabel_rfm$recency_score,2), nsmall = 1), 
                    frequency_score = format(round(tabel_rfm$frequency_score,2), nsmall = 1), 
                    monetary_score = format(round(tabel_rfm$monetary_score,2), nsmall = 1))