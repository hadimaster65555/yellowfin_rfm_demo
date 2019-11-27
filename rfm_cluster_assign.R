library(tidyverse)

rfm_cluster_assignment <- function(recency_score, frequency_score, monetary_score){
  case_when(
    recency_score >= 4 & frequency_score >= 4 & monetary_score >= 4  ~ "best_customer",
    recency_score >= 2 & frequency_score >= 3 & monetary_score >=3 ~ "Loyal Customer",
    recency_score >= 3 & (frequency_score >=1 | frequency_score <4) & (monetary_score>=1 | monetary_score < 4) ~ "Potential Loyalist",
    recency_score >=4 & frequency_score <=1 & monetary_score <=1 ~ "New Customer",
    (recency_score >=3 | recency_score < 5) & frequency_score <=1 & monetary_score <=1 ~ "Promising",
    (recency_score >= 2 | recency_score < 4) & (frequency_score >=2 | frequency_score < 4) & (monetary_score >=2 | monetary_score<4) ~ "Need Attention",
    (recency_score >=2 | recency_score > 4) & frequency_score <=2 & monetary_score <=2 ~ "About to sleep",
    recency_score <=2 & frequency_score >=2 & monetary_score >=2 ~ "At Risk",
    recency_score <=1 & frequency_score >=4 & monetary_score >=4 ~ "Don't lose them",
    (recency_score >= 1 | recency_score <3) & (frequency_score >=1 | recency_score < 3) & (monetary_score >=1 | monetary_score < 3) ~ "Hibernating",
    recency_score <=2 & frequency_score <=2 & monetary_score <=2 ~ "Lost"
  )
}

raw_data %>% 
  mutate(cluster = rfm_cluster_assignment(recency_score, frequency_score, monetary_score)) -> result