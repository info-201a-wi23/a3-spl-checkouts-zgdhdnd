
library(ggplot2)
library(dplyr)
library(tidyverse)
df <- read.csv("Checkouts_by_Title.csv")

digitalData <- df %>%
  filter(CheckoutYear < 2023) %>%
  filter(UsageClass == "Digital") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts))

physicalData <- df %>%
  filter(CheckoutYear > 2006) %>%
  filter(CheckoutYear < 2023) %>%
  filter(UsageClass == "Physical") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts))

physicalCheckoutsData <- as.numeric(physicalData$number)
digitalCheckoutsData <- as.numeric(digitalData$number)


chartData <- data.frame(Year = rep(2007:2022, 2), 
                 CheckoutsNumber = c(physicalCheckoutsData,digitalCheckoutsData), 
                 UsageClass = c(rep(paste0("Physical"), each = 16), rep(paste0("Digital"), each = 16)))

ggplot(data = chartData, aes(x = Year, y = CheckoutsNumber)) +
  geom_line(aes(colour = UsageClass)) +
  ggtitle("Checkouts Number of Physical and Digital Products from 2007 to 2022") +
  labs(y = "the Number of Checkouts of this Year")
  