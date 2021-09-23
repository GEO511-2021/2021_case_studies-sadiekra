install.packages("gapminder")
library(ggplot2) 
library(gapminder)
library(dplyr)
library(tidyverse)

data(gapminder)
str(gapminder)

#remove Kuwait from datas
no_kuwait <- gapminder%>%
filter(country != "Kuwait")

no_kuwait %>% mutate(pop=pop/100000)

#plot1
plot1 <- ggplot(no_kuwait, aes(x=lifeExp, y=gdpPercap, color=continent, 
                               size=pop/100000)) +
  geom_point() +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year,nrow=1) +
  theme_bw()+
  xlab("Life Expectancy (Years)") +
  ylab("GDP Per Capita") +
  ggtitle("Wealth and Life Expectancy")+
  theme(plot.title = element_text(hjust = 0.5)) +
  guides(size=guide_legend("Population 100k"))
plot1

#plot2 data
data(gapminder)
str(gapminder) 

by_continent <- gapminder %>% group_by(continent, year)

gapminder_continent<- by_continent %>% summarise(
  gdpPercapweighted = weighted.mean(x=gdpPercap, w=pop),
  pop = sum(as.numeric(pop))
)

gapminder_continent

#plot2
plot2 <- ggplot(gapminder, aes(x=year, y=gdpPercap, color=continent, size=pop/100000))+ 
  geom_line(aes(group=country)) +
  geom_point()+
  geom_line(gapminder_continent, mapping = aes(year, gdpPercapweighted), col="black") +
  geom_point(gapminder_continent, mapping = aes(year, gdpPercapweighted), col="black") +
  guides(size=guide_legend("Population 100k")) +
  theme_bw() +
  facet_wrap(~continent, nrow=1)
plot2

