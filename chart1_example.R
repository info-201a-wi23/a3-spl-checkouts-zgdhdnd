
library(ggplot2)
library(dplyr)
library(tidyverse)
data1 <- read.csv("Checkouts_by_Title.csv")

yd <- data1 %>%
  filter(CheckoutYear < 2023) %>%
  filter(UsageClass == "Digital") %>%
  group_by(CheckoutYear) %>%
  summarise(b = sum(Checkouts))

yp <- data1 %>%
  filter(CheckoutYear > 2006) %>%
  filter(CheckoutYear < 2023) %>%
  filter(UsageClass == "Physical") %>%
  group_by(CheckoutYear) %>%
  summarise(a = sum(Checkouts))

a1 <- as.numeric(yp$a)
b1 <- as.numeric(yd$b)
c1 = a1 + b1
x <- seq(2007, 2022)

df <- data.frame(Year = rep(2007:2022, 2), 
                 CheckoutsNumber = c(a1,b1), 
                 UsageClass = c(rep(paste0("Physical"), each = 16), rep(paste0("Digital"), each = 16)))

ggplot(data = df, aes(x = Year, y = CheckoutsNumber)) +
  geom_line(aes(colour = UsageClass)) +
  ggtitle("Checkouts Number of Physical and Digital Products from 2007 to 2022")
  