library(tidyverse)
library(ggplot2)

setwd("C:\\Users\\Анастасия\\Documents\\r_projects\\girls_nstu")

t <- read.table("stud.csv", sep=";", header=TRUE, row.name=NULL)
t<-na.omit(t1)
t$SEX[t1$SEX == 0]<- "female"
t$SEX[t1$SEX == 1]<- "male"
t$SEX <- factor(t1$SEX)

t1 <- t  %>% select(YEAR_ABITURA, SHORTNAME,SEX)
names(t1) <-c("year", "dept", "sex")
#maybe add excact count and each year label
ggplot(t1, aes(x=year, fill = sex)) + geom_histogram(binwidth=.5, position="dodge")
#divide per dept
#how many enrolled vs graduated
t2 <- t  %>% select(YEAR_ABITURA, SHORTNAME,SEX)
names(t1) <-c("year", "dept", "sex")
#averege enrollment grades
#average grades