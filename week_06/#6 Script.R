library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

#load 'world' data from spData package
data(world)
tmax_monthly <- getData(name = "worldclim",
                        var="tmax", res=10)
world$subregion
world <- filter(world, subregion!= "Antarctica")
#Convert to sp object from sf
as(world, "Spatial")

tmax_monthly
plot(tmax_monthly)
#Convert to celsius
gain(tmax_monthly) <- 0.1
plot(tmax_monthly)

tmax_annual <- max(tmax_monthly)
plot(tmax_annual)
#Change the name of the layer to "tmax"
names(tmax_annual) <- "tmax"

#Calculate the max temperature observed in each country
max_temp_country <- raster::extract(tmax_annual, world, fun=max, na.rm=T, small=T, sp=T)
#Convert object to sf
max_temp_country <- st_as_sf(max_temp_country)

#Make a map
ggplot(max_temp_country) +
  geom_sf(aes(fill=tmax)) +
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)") +
  theme(legend.position = 'bottom')

#Create a summary table
hottest_country <- max_temp_country%>%
  group_by(continent)%>%
  top_n(tmax, n=1)%>%
  select(name_long, continent, tmax)%>%
  arrange(desc(tmax))%>%
  st_set_geometry(NULL)
hottest_country
  
  
