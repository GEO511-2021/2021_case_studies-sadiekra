#Load needed libraries
library(tidyverse)
library(nycflights13)
#Examine datasets
str(flights)
data(flights)
view(flights)
view(airports)
#Organize flight dataset by the distance in descending order and choose the first row
flight_arrange <- flights%>%
  arrange(desc(distance))%>%
  slice(1)
#Use merge function to combine datasets, "dest" and "faa" have same data (keys) then select the name of airport
farthest_airport <-
  merge(x=flight_arrange, y=airports, by.x = "dest", by.y = "faa", x.all=TRUE, y.all=FALSE )%>%
  select(name)
#Channge the name to a character, not a dataset
farthest_airport <- as.character(farthest_airport)
class(farthest_airport)
#Check results
farthest_airport

airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("world") +
  geom_point(col="red") +
  coord_quickmap()

mean_delay <- merge(flights, airports, by.x = "dest", by.y = "faa", x.all=TRUE, y.all=FALSE )

mean_delay%>%
  group_by(dest,lat,lon)%>%
 summarise(mean_delay1 = mean(arr_delay, na.rm=TRUE))

ggplot(mean_delay, aes(lon,lat, color= mean_delay1)) +
  geom_point() +
  borders("state") +
  coord_quickmap()