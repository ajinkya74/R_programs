
library(tidyverse)
source('hw.R')

#create a dataset with 2000 realizations of t-distribution and 2000 realizations of standard normal
df <- data.frame(y = c(rchisq(2000,df=5),rnorm(2000)),
                 dist=c(rep('chi-sq(df=5)',2000),rep('sdnorm',2000)));

#plot density estimates on same scale for comparison
ggplot(data = df, aes( x = y, group = dist, fill = dist)) +
  geom_density( color = "black", adjust = 2, alpha = .2) +
  scale_fill_manual(
    values = c("red", "yellow"),
    na.value="grey70") + hw

p <- ggplot(df[df$dist=='chi-sq(df=5)',], aes(sample = y))
p + geom_qq() + geom_qq_line()