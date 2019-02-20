## FIRST PLOTS USING GGPLOT ##
# objective: create a (pretty) plot with ggplot 

# clear workspace
#rm(list=ls())

# packages ----
# for working with data
library(dplyr)
# for plotting
library(ggplot2)

# data -----
iris<-iris
#iris data set gives the measurements in 
# centimeters of the variables sepal length, 
# sepal width, petal length and petal width, 
# respectively, for 50 flowers from each of 3 species of iris. 
# The species are Iris setosa, versicolor, and virginica.




# 1st plot: Density plot for Sepal.Length -----
# kernel density plot
# (smoothed version of histogram)
# generally preferrable to histogram for continuous data

#
iris %>% # data
  ggplot() # creates empty plot (coordinate system for plot) for data

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length)) # adds density plot for Sepal.Length
       # n.b. aes specifies the 'mapping variables'

# we now have our basic density plot
# now we add the options to make it look nicer

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey")  # we can fill with a colour

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour="red") # we can change the colour of the line

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)  # or remove the line

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)+
  theme_bw() #we can change the background using theme_bw

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)+
  theme_minimal() # or theme_minimal

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)+
  theme_minimal(base_size = 18) # and increase the text size

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)+
  theme_minimal(base_size = 18)+
  xlab("Sepal Length")+ #we can change the x axis label
  ylab("Density")  #and the y axis label

iris %>%
  ggplot()+
  geom_density(aes(Sepal.Length),
               fill="grey", 
               colour=NA)+
  theme_minimal(base_size = 18)+
  xlab("Sepal Length")+ 
  ylab("Density")+
  ggtitle("Kernel density plot of sepal length") # and add a title

# we can then save the plot
# using ggsave
?ggsave
# ggsave("filename")

# and we can specify width and height
# ggsave("filename",
#         width = x,     
#         height = x)
# 2nd plot: Scatter plot for Sepal.Length vs Sepal.Width -----

#as before
iris %>% # data
  ggplot() # creates empty plot (coordinate system for plot) for data


iris %>%
  ggplot()+
  geom_point(aes(x=Sepal.Length,
                 y= Sepal.Width)) 
# adds scatterplot for Sepal.Length (along x axis)
# and Sepal.Width (along y axis)

#let's split by Species
iris %>%
  ggplot()+
  geom_point(aes(x=Sepal.Length,
                 y= Sepal.Width,
                 colour=Species)) 
             # we can have a different colour for each species
iris %>%
  ggplot()+
  geom_point(aes(x=Sepal.Length,
                 y= Sepal.Width,
                 colour=Species,
                 shape=Species)) 
           # and a different shape

# or alternatively, we could plot each Species seperately
iris %>%
  ggplot()+
  geom_point(aes(x=Sepal.Length,
                 y= Sepal.Width))+
  facet_grid(.~Species)

# and we can make the plots look nicer
# in a similar way we did before
iris %>%
  ggplot()+
  geom_point(aes(x=Sepal.Length,
                 y= Sepal.Width,
                 colour=Species,
                 shape=Species)) +
  theme_minimal(base_size = 18)+
  xlab("Sepal Length")+ 
  ylab("Sepal Width")+
  ggtitle("Scatter plot of sepal length and sepal width") 
