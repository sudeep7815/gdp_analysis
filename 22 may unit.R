# Load necessary libraries
library(ggplot2)
library(dplyr)

# Bar plot using mtcars data
ggplot(data = mtcars %>% head(), aes(x = disp, y = wt)) +
  geom_bar(stat = "identity")  # Specify stat="identity" for bar height to reflect y values

# Read sales data from CSV
sale <- read.csv("sample_sales_data.csv")

# View column names (optional)
colnames(sale)

# Scatter plot with custom colors
ggplot(sale, aes(x = UnitPrice, y = TotalPrice,
                 shape =Product, color = Status)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("pink", "lightblue", "green")) +
  theme_minimal() +
   # theme_classic() +
   # theme_void()
   labs(title = "Price comparision")+
  scale_colour_brewer(palette = "Set2")+
  facet_grid(Product~Status)

ggplot(sale, aes(x = UnitPrice, y = TotalPrice,
                 shape =Product, color = Status)) +
  geom_point(size = 3) +
  labs(title = "Price comparision")+
  scale_colour_brewer(palette = "Set2")+
  facet_grid(Product~Status)


ggplot(sale, aes(x = UnitPrice, y = TotalPrice,
                 shape =Product, color = Status)) +
  geom_point(size = 3) +
  labs(title = "Price comparision")+
  scale_colour_brewer(palette = "Set2")+
  facet_wrap(~Status)+
  theme(
    legend.position = "bottom"
  )


ggplot(sale,aes(x = UnitPrice, y = TotalPrice)) +
  geom_point(size = 3)+
  # theme_classic() +
  labs(title = "Price comparision")+
    scale_colour_brewer(palette = "Set2")+
# xlim(250,500)+
    scale_x_continuous(breaks = seq(250,500,by = 25),
                   limits = c(250,500))+
    scale_y_continuous(breaks = seq(2000,5000,by = 250),
                       limits = c(2000,5000))
  
  