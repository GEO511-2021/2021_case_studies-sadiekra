# Open dataset called Iris (already in library)
data(iris)

#Define new variable that only uses one column of the dataset
iris_petal_length=iris$Petal.Length

#Fine the mean and define a new object
petal_length_mean=mean(iris_petal_length)

#Plot the histogram using the earlier object
hist(iris_petal_length,
     col = "purple", 
     main = "Iris Petal Length", 
     xlab="Petal Length",
     border = "white")

#Ggplot Example
#Install ggplot
install.packages("ggplot2")
library(ggplot2)

#Plot the histogram
ggplot(iris_petal_length, 
      geom = "histogram",
      fill= I("purple"),
      alpha=0.5,
      col=I("black"),
      xlab= "Petal Length",
      binwidth=)

