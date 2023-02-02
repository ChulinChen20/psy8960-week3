# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv("data/week3.csv")
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- raw_df[format(raw_df$timeStart, "%m") != "06",]
clean_df <- clean_df[clean_df$q6 == 1,]

# Analysis
clean_df$timeSpent <- difftime(clean_df[,2],clean_df[,1], units = "secs")
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(clean_df[,5:14], table)
lapply(frequency_tables_list,barplot)
