library(ggplot2)
library(dplyr)
library(tidyverse)
df <- read.csv("Checkouts_by_Title.csv")

df <- df %>%
  group_by(CheckoutYear) %>%
  filter(CheckoutYear < 2023) %>%
  summarise(number = sum(Checkouts))

checkoutsNumberByYear <- as.numeric(df$number)



chartData <- data.frame(Year = rep(2005:2022), 
                 CheckoutsNumberByYear = checkoutsNumberByYear)

ggplot(data = chartData, aes(x = Year, y = CheckoutsNumberByYear)) +
  geom_line() +
  ggtitle("Total Checkouts Number of SPL by Year") +
  labs(y = "the Number of Checkouts of this Year")