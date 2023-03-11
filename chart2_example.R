library(ggplot2)
library(dplyr)
library(tidyverse)
df <- read.csv("Checkouts_by_Title.csv")

videodiscData <- df %>%
  filter(CheckoutYear < 2023) %>%
  filter(CheckoutYear > 2006) %>%
  filter(MaterialType == "VIDEODISC") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts))

bookData <- df %>%
  filter(CheckoutYear > 2006) %>%
  filter(CheckoutYear < 2023) %>%
  filter(MaterialType == "BOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts))

bookCheckoutsByYear <- as.numeric(bookData$number)
videodiscCheckoutsByYear <- as.numeric(videodiscData$number)

chartData <- data.frame(Year = rep(2007:2022, 2), 
                 CheckoutsNumber = c(bookCheckoutsByYear,videodiscCheckoutsByYear), 
                 MaterialType = c(rep(paste0("BOOK"), each = 16), rep(paste0("VIDEODISC"), each = 16)))

ggplot(data = chartData, aes(x = Year, y = CheckoutsNumber)) +
  geom_line(aes(colour = MaterialType)) +
  ggtitle("Checkouts Number of Book and Videodisc from 2007 to 2022") +
  labs(y = "the Number of Checkouts of this Year")
