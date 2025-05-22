install.packages("ggplot2")



library(ggplot2)

library(tidyverse)

mtcars
iris

"sample_sales_data.csv" %>% 
  read_csv() -> sale

tibble(age = c(12,21,32,43,11),
        height = c(160,150,149,123,170),
       name = c("x","y","z","a","b"))-> df

ggplot(df,aes(x = age,y = height)) + 
         geom_bar(stat = "identity")

ggplot(data = mtcars %>% head(),aes( x= disp,y = wt))+ # x axis, y axis and data
  geom_bar # what kind of plot
 
ggplot(df,aes(x = age,y = height)) + 
  geom_line(stat = "identity")

ggplot(data = mtcars %>% head(),aes( x= disp,y = wt))+ # x axis, y axis and data
  geom_line
  
  ggplot(data = sale,aes(x= Product,y = Quantity))+ # x axis, y axis and data
    geom_bar(stat = "identity") # what kind of plot
  
  
  ##histogram(disribution of variable)
  
  ggplot(data = mtcars,aes(x = mpg))+
    geom_histogram(binwidth = 2)
  
  ##example 1
  ggplot(data =mtcars, aes(x=wt,y=mpg))+
    geom_point()+
    labs(title = "Weight vs Mileage",x= "Weight",y="Miles per gallon")
  
  #example 2 Addition of caption, subtitle along with the lables and titles
  ggplot(data =iris, aes(x=Sepal.Length,y=Sepal.Width))+
    geom_point()+
    labs(title = "Sepal Dimensions",subtitle = "Grouped By Species",
         caption ="Source: iris dataset")
  
  #example 3 use a theme
  ggplot(data =iris, aes(x=Sepal.Length,y=Sepal.Width, colour = Species))+
    geom_point()+
    labs(title = "Sepal Dimensions",subtitle = "Grouped By Species",
         caption ="Source: iris dataset")+
    theme_minimal()
  
  #example 4 combine multiple aesthetics
  ggplot(data = iris, aes(x = Sepal.Length,
                         y=Sepal.Width,colour = Species,shape = Species))+
    geom_point(size = 3)
  
                  
  
  ------------------------------------------------------------------
    ##3. Understanding Aesthetics (aes)
   ----------------------------------
  
  # Example 1: Add color by category
  ggplot(data = iris, aes(x = Sepal.Length,
                          y = Sepal.Width,color = Species)) +
    geom_point()
  
  # Example 2: Change size by a variable
  ggplot(data = mtcars,aes(x = wt, y = mpg)) +
    geom_point(size = 5,shape = 2) +
    geom_line(size = 0.4)
  
  # Example 3: Use shape aesthetic
  ggplot(data = iris, aes(x = Sepal.Length,
                          y = Sepal.Width,shape = Species)) +
    geom_point()
  
  # Example 4: Combine multiple aesthetics
  ggplot(data = iris, aes(x = Sepal.Length,
                          y = Sepal.Width, color = Species,shape = Species)) +
    geom_point(size = 3)
                  
  ------------------------------------------------------------------------------------
    # colors,fill and legends
    
  #ex 1:manual colour change
    ggplot(iris,aes(x = Species,y = Sepal.Length,fill = Species))+
    geom_boxplot()+
    scale_fill_manual(values = c("setosa" = "red","versicolor" = "blue","virginica"="green"))
                  
  ##Ex 2 Gradient colour based on value
  
  ggplot(mtcars,aes(x = wt,y = mpg,colour = hp))+
    geom_point()+
    scale_color_gradient()
    
    
    
    
    
  