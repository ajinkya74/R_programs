
library(tidyverse)
library(micromapST)

#Read file
data_all <- read.csv(
  file="uteruscancer.csv",
  header=T, as.is=TRUE)

#skeleton 
panelDesc <- data.frame(
  type=c('maptail','id','dotconf','dotconf'),
  lab1=c(NA,NA,'Age adjusted death rates ','Recent 5-year trend'),
  lab2=c(NA,NA,'and 95% CIs','and 95% CIs'),
  col1=c(NA,NA,'Age.Adjusted.Death.Rate','Recent.5.Year.Trend'),
  col2=c(NA,NA,'Lower.95..CI','Lower.95..CI.Trend'),
  col3=c(NA,NA,'Upper.95..CI','Upper.95..CI.Trend'))

fName = "cancer_death_rates DotConf.pdf"
pdf(file=fName,width=7.5,height=10)
micromapST(data_all, panelDesc,
           rowNamesCol='State',
           rowNames='full',
           sortVar='Recent.5.Year.Trend',ascend=FALSE,
           title=c("Death Rates Of United States","Uters Cancer,2011-2015,Female,Ages 50+"),
                  
           ignoreNoMatches=TRUE)


dev.off()
