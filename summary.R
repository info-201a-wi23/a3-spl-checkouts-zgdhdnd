library(dplyr)
library(tidyverse)
df <- read.csv("Checkouts_by_Title.csv")


digitalCheckouts <- df %>%
  filter(UsageClass == "Digital") %>% summarise(sum = sum(Checkouts))

physicalCheckouts <- df %>%
  filter(UsageClass == "Physical") %>% summarise(sum = sum(Checkouts))


physicalCheckouts2022 <- df %>%
  filter(CheckoutYear == 2022) %>%
  filter(UsageClass == "Physical") %>% summarise(sum = sum(Checkouts))

digitalCheckouts2022 <- df %>%
  filter(CheckoutYear == 2022) %>%
  filter(UsageClass == "Digital") %>% summarise(sum = sum(Checkouts))

totalCheckouts <- digitalCheckouts + physicalCheckouts
totalCheckouts2022 <- digitalCheckouts2022 + physicalCheckouts2022

percentageDigital <- round(digitalCheckouts / totalCheckouts, 3) * 100
percentagePhysical <- round(physicalCheckouts / totalCheckouts, 3) * 100

percentageDigital2022 <- round(digitalCheckouts2022 / totalCheckouts2022, 3) * 100
percentagePhysical2022 <- round(physicalCheckouts2022 / totalCheckouts2022, 3) * 100
