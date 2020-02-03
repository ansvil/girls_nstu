library(tidyverse)
library(ggplot2)

setwd("C:\\Users\\Àíàñòàñèÿ\\Documents\\r_projects\\girls_nstu")

t <- read.table("stud.csv", sep=";", header=TRUE, row.name=NULL)
t<-na.omit(t)
#t <- t[which(t$SHORTNAME != "ÈÑÒÐ" & t$SHORTNAME != "ÔÃÎ" & t$SHORTNAME != "ÔÁ" & t$SHORTNAME != "ÞÔ") ,]
t$SEX[t$SEX == 0]<- "female"
t$SEX[t$SEX == 1]<- "male"
t$SEX <- factor(t1$SEX)

#how many enrolled
t1 <- t  %>% select(YEAR_ABITURA, SHORTNAME,SEX)
names(t1) <-c("year", "dept", "sex")
t1<-na.omit(t1)
#maybe add excact count and each year label
ggplot(t1, aes(x=year, fill = sex)) + geom_histogram(binwidth=.5, position="dodge")
#divide per dept

#how many graduated
t2 <- t  %>% select(YEAR_ABITURA, SHORTNAME,SEX, IS_UCH)
t2<- t2[which(t2$IS_UCH==1),]
t2 <- t2  %>% select(YEAR_ABITURA, SHORTNAME, SEX)
names(t2) <-c("year", "dept", "sex")
t2<-na.omit(t2)
ggplot(t2, aes(x=year, fill = sex)) + geom_histogram(binwidth=.5, position="dodge")

#averege enrollment grades
t3 <- t  %>% select(YEAR_ABITURA, SHORTNAME, SEX, EGE)
names(t3) <-c("year", "dept", "sex", "scores")
t3<-na.omit(t3)
means <- t3 %>% group_by(year,sex) %>% 
  summarise(mean_scores = mean(scores))

ggplot(means, aes(x=year, y= mean_scores, fill = sex)) + geom_bar(stat='identity', position="dodge")

#average first term grades
t4 <- t  %>% select(YEAR_ABITURA, SHORTNAME,SEX,STUD_MARK1)
names(t4) <-c("year", "dept", "sex", "scores")
t4<-na.omit(t4)
means <- t4 %>% group_by(year,sex) %>% 
  summarise(mean_scores = mean(scores))

ggplot(means, aes(x=year, y= mean_scores, fill = sex)) + geom_bar(stat='identity', position="dodge")
