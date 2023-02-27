library(ggplot2)
library(dplyr)
library(tidyverse)
data1 <- read.csv("Checkouts_by_Title.csv")

vd <- data1 %>%
  filter(CheckoutYear < 2023) %>%
  filter(CheckoutYear > 2006) %>%
  filter(MaterialType == "VIDEODISC") %>%
  group_by(CheckoutYear) %>%
  summarise(num1 = sum(Checkouts))

ab <- data1 %>%
  filter(CheckoutYear > 2006) %>%
  filter(CheckoutYear < 2023) %>%
  filter(MaterialType == "BOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(num2 = sum(Checkouts))

ab1 <- as.numeric(ab$num2)
vd1 <- as.numeric(vd$num1)

df <- data.frame(Year = rep(2007:2022, 2), 
                 CheckoutsNumber = c(ab1,vd1), 
                 MaterialType = c(rep(paste0("BOOK"), each = 16), rep(paste0("VIDEODISC"), each = 16)))

ggplot(data = df, aes(x = Year, y = CheckoutsNumber)) +
  geom_line(aes(colour = MaterialType)) +
  ggtitle("Checkouts Number of Book and Videodisc from 2007 to 2022")
