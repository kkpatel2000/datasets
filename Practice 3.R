# Load the Libraries:
library(RColorBrewer)
library(readxl)
library(readr)
library(tidyverse)
library(dplyr)
library(knitr)
library(data.table)
library(kableExtra)
library(patchwork)

# Import Data set
Air_Quality <- airquality
Air_Quality1 <- Air_Quality %>% na.omit()  # Remove NA values
View(Air_Quality)

## HYPOTHESIS Test:

#1 Hypothesis: To provide enough power to a whole city, the mean wind speed should be greater than 10.5 mph.
# mu = 10.5
# Alternative Hypothesis: It states that the mean is less than 10.5 mph

# Hypothesis Data subset
Hyp_WindSpeed <- subset(Air_Quality1, select = c("Wind"))
view(Hyp_WindSpeed)

mean(Hyp_WindSpeed$Wind)
sd(Hyp_WindSpeed$Wind)

# Graphical Representation
ggplot(Hyp_WindSpeed, aes(x=Wind)) + 
  geom_histogram(color="Black", fill="Skyblue", bins = 20) +
  labs(x="Wind Speed (mph)", y="Frequency") +
  geom_vline(xintercept = mean(Hyp_WindSpeed$Wind), color = "Red")

# t-test
t.test(Hyp_WindSpeed$Wind, mu = 10.5, alternative = "less")