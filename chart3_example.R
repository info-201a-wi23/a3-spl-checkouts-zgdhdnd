library(ggplot2)
library(dplyr)
library(tidyverse)
data1 <- read.csv("Checkouts_by_Title.csv")

e <- data1 %>%
  group_by(CheckoutYear) %>%
  filter(CheckoutYear < 2023) %>%
  summarise(num1 = sum(Checkouts))

vd1 <- as.numeric(e$num1)



df <- data.frame(Year = rep(2005:2022), 
                 CheckoutsNumber = vd1)

ggplot(data = df, aes(x = Year, y = CheckoutsNumber)) +
  geom_line() +
  ggtitle("Total Checkouts Number of SPL by Year")