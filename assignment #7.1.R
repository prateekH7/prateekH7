
library(ggplot2)
library(maps)

data("USArrests")
names(USArrests)
variable_of_interest <- "Murder"
state_map <- map_data("state")

state_data <- merge(state_map, USArrests, by.x = "region", by.y = "row.names", all.x = TRUE)

choropleth_map <- ggplot(state_data, aes(x = long, y = lat, group = group, fill = !!as.name(variable_of_interest))) +
  geom_polygon() +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = paste("State-level Choropleth of", variable_of_interest)) +
  theme_minimal()


print(choropleth_map)
