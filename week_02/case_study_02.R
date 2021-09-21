library(ggplot2)
library(tidyverse)
install.packages("ggthemes")
library(ggthemes)
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"
temp=read_table(dataurl,
                #skip the first line which has column names
                skip=3, 
                # tell R that 999.90 means missing in this dataset
                na="999.90", 
                # define column names 
                col_names = c("YEAR","JAN","FEB","MAR",
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))
# renaming is necessary becuase they used dashes ("-")
# in the column names and R doesn't like that
summary(temp)
Temperature_Plot<-ggplot(temp, aes(YEAR,JJA)) +
  geom_line()+
  geom_smooth(color="red") +
  xlab("Year") +
  ylab("Mean Annual Temperature (C)") +
  theme_dark()+
  ggtitle("Mean Summer Temperatures in Buffalo",
          subtitle = "Summer Includes June, July, and August") 
Temperature_Plot
#Save as a png
# PNG device
png("temperature_plot.png")

# Code
Temperature_Plot

# Close device
dev.off()
