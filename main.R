# install.packages("tidyverse")
library(tidyverse)
source('hw.R') # Instructor provide ggplot theme
?read.csv
adm<-read.csv('adm.csv',sep=",")
head(adm)
summary(adm)
adm
adm2 <- as_tibble(adm)



##################Proportion for 2 part problem adm#################
ggplot(data = adm2) + 
  geom_bar(mapping = aes(x = Admit,y=Prop, fill = Gender), stat = "identity")+
  labs(x = "Admission Status",
       y = "Proportions",
       title = "Graduate school applicants at Berkeley in 1973 ",
       fill = "Color") + hw

####################Departmental wise 2nd part problem ###################
library(reshape2)

admbydept<-read.csv('admbydept.csv',sep=",")
admbydept2<-as_tibble(admbydept)
admbydept2$x <- paste(admbydept$Dept,admbydept$Admit)

ggplot(data = admbydept2) + 
  geom_bar(mapping = aes(x = x,y=Prop, fill = Gender), stat = "identity")+
  labs(x = "Admission Status by departments",
       y = "proportion",
       title = "Graduate school applicants at Berkeley in 1973 by departments",
       fill = "Color") +hw

###############################




