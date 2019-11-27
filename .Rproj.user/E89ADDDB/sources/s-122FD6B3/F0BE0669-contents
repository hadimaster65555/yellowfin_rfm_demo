library(dplyr)

raw_data %>% 
  select(recency_score, frequency_score, monetary_score) -> data_model

kmeans_obj <- kmeans(data_model, 3)

cluster <- kmeans_obj$cluster

hasil <- data.frame(c(raw_data), format(round(cluster,2), nsmall = 1))