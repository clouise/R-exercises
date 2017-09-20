setwd("")

# Load the data and inspect its structure
df <- read.csv("exer-1.csv")
head(df)
str(df)

# Check for missing values
apply(df, 2, function(x) sum(is.na(x)))

# Check for balance in between-subjects factor
table(df$diet)
table(df$exertype)
table(df$diet,df$exertype)

# Generate descriptive statistics for the sex variable which is a between subjects factor
library(dplyr)
df %>% group_by(diet) %>% summarise(mean=mean(pulse), n=n(),sd=sd(pulse), min=min(pulse), max=max(pulse))

# Generate descriptive statistics for the treatment level variable which is a between subjects factor
df %>% group_by(exertype) %>% summarise(mean=mean(pulse), n=n(),sd=sd(pulse), min=min(pulse), max=max(pulse))

# Generate descriptive statistics for the weeks variable which is the within subjects factor
df %>% group_by(time) %>% summarise(mean=mean(pulse), n=n(),sd=sd(pulse), min=min(pulse), max=max(pulse))

# Use histograms to assess distribution across within subjects factor.
library(ggplot2)
ggplot(df,aes(x=pulse)) + geom_histogram(binwidth = 3) + facet_grid(. ~ time)

# Perform a repeated measures analysis with only the within subjects factor

