library(dplyr)
library(tidyverse)
data1 <- read.csv("Checkouts_by_Title.csv")


digitalCheckouts <- data1 %>%
  filter(UsageClass == "Digital") %>% summarise(sum = sum(Checkouts))

physicalCheckouts <- data1 %>%
  filter(UsageClass == "Physical") %>% summarise(sum = sum(Checkouts))


physicalCheckouts2022 <- data1 %>%
  filter(CheckoutYear == 2022) %>%
  filter(UsageClass == "Physical") %>% summarise(sum = sum(Checkouts))

digitalCheckouts2022 <- data1 %>%
  filter(CheckoutYear == 2022) %>%
  filter(UsageClass == "Digital") %>% summarise(sum = sum(Checkouts))

totalCheckouts <- digitalCheckouts + physicalCheckouts
checkouts2022 <- digitalCheckouts2022 + physicalCheckouts2022

rateTotalDigital <- round(digitalCheckouts / totalCheckouts, 3)
rateTotalPhysical <- round(physicalCheckouts / totalCheckouts, 3)

rate2022Digital <- round(digitalCheckouts2022 / checkouts2022, 3)
rate2022Physical <- round(physicalCheckouts2022 / checkouts2022, 3)
