students <- tibble(
  Name = c("Asha", "Ben", "Chitra", "Dev", "Esha", "Farhan", "Geeta", "Hari", "Isha", "Jay"),
  Gender = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  Score = c(78, 85, 69, 92, 88, 76, 83, 95, 70, 80),
  Hours = c(5, 7, 4, 9, 6, 5, 8, 10, 3, 6),
  Department = c("Math", "Science", "Math", "Math", "Science", "Science", "Math", "Science", "Math", "Science")
)




##task 1 plot score vs hours
ggplot(data=students,aes(x=Score,y=Hours,colour = Gender))+
  geom_point()+
  geom_line()+
  facet_wrap(~Department)+
 labs(title = "student details")+
  #theme(legend.position = "none")
  
  
  
  ggplot(data=students,aes(x=Score,y=Hours,
                           colour = Gender,size = Score,
                           shape = Department))+
  geom_point()+
 labs(title = "students",subtitle = "grouped by scores",
     caption = "source:acadamic details")+
  facet_grid(Department~Gender)



read.csv("city_day.csv")->city_data

city_data  
colnames(city_data) 
glimpse(city_data)  

  