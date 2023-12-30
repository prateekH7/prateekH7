# Load necessary libraries
library(ggplot2)
library(readxl)

# Load the dataset
data <- read_excel("companies in  India.xlsx")
names(data)

# Convert to numeric
data$`Revenue(billions US$)` <- as.numeric(data$`Revenue(billions US$)`)
data$`Profit(billions US$)` <- as.numeric(data$`Profit(billions US$)`)


# 1.Scatter plot of Revenue vs. Profit with improved aesthetics
ggplot(data, aes(x = `Revenue(billions US$)`, y = `Profit(billions US$)`)) +
  geom_point(color = "red", alpha = 0.8) +  # Blue color with transparency
  labs(title = "Scatter Plot of Revenue vs. Profit",
       x = "Revenue (billions US$)",
       y = "Profit (billions US$)") +
  theme_minimal() +  # Minimal theme
  theme(
    text = element_text(family = "Arial", color = "black"),  # Font family and text color
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center the title and adjust font size
    panel.grid.major = element_line(color = "white"),  # Grid color
    panel.background = element_rect(fill = "#ecf0f1"),  # Background color
    axis.text = element_text(size = 10),  # Adjust axis text font size
    axis.title = element_text(size = 12, face = "bold"),  # Adjust axis title font size and style
    legend.position = "none"  # Remove legend
  )



# 2. Bar plot of Value(billions US$) by Rank with improved aesthetics
ggplot(data, aes(x = Rank, y = `Value(billions US$)`)) +
  geom_bar(stat = "identity", fill = "#F51140", alpha = 0.8) +  # Blue color with transparency
  labs(title = "Bar Plot of Value by Rank",
       x = "Rank",
       y = "Value (billions US$)") +
  theme_minimal() +  # Minimal theme
  theme(
    text = element_text(family = "Arial", color = "black"),  # Font family and text color
    axis.text.x = element_text(angle = 45, hjust = 1),  # Adjust x-axis text angle
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),   # Remove minor grid lines
    plot.title = element_text(hjust = 0.5),  # Center the title
    plot.background = element_rect(fill = "white", color = "black", linetype = "solid"),  # Background color and border
    panel.border = element_rect(color = "black", linetype = "solid", fill = NA),  # Border color
    panel.grid = element_line(color = "black"),  # Grid color
    legend.position = "none"  # Remove legend
  )


# 3. Box plot of Rank by Headquarters with modified aesthetics
ggplot(data, aes(x = Headquarters, y = Rank)) +
  geom_boxplot(fill = "#E3F547", color = "black", alpha = 1) +  # Yellow fill, blue border with transparency
  labs(title = "Box Plot of Assets by Industry",
       x = "Headquarters",
       y = "Rank") +
  theme_minimal() +  # Minimal theme
  theme(
    text = element_text(family = "Arial", color = "#2c3e50"),  # Font family and text color
    axis.text.x = element_text(angle = 45, hjust = 1),  # Adjust x-axis text angle
    panel.grid.major = element_line(color = "grey"),  # Grid color
    panel.background = element_rect(fill = "#ecf0f1"),  # Background color
    plot.title = element_text(hjust = 0.5),  # Center the title
    panel.border = element_rect(color = "black", linetype = "solid", fill = NA)  # Border color
  )


# 4. Pie chart for the distribution of companies across different industries with improved aesthetics
ggplot(data, aes(x = "", fill = Industry)) +
  geom_bar(width = 1, color = "white") +
  coord_polar(theta = "y") +
  labs(title = "Distribution of Companies by Industry",
       fill = "Industry") +
  theme_minimal() +  # Minimal theme
  theme(
    text = element_text(family = "Arial", color = "#2c3e50"),  # Font family and text color
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center the title and adjust font size
    panel.background = element_rect(fill = "#ecf0f1"),  # Background color
    axis.text = element_blank(),  # Remove axis text
    axis.ticks = element_blank(),  # Remove axis ticks
    legend.position = "bottom",  # Move legend to the bottom
    legend.title = element_text(size = 12, face = "bold"),  # Adjust legend title font size and style
    legend.text = element_text(size = 10)  # Adjust legend text font size
  )



# 5. Violin plot of Forbes 2000 rank by Headquarters with improved aesthetics
ggplot(data, aes(x = Headquarters, y = `Forbes 2000 rank`)) +
  geom_violin(fill = "#8E44AD", color = "black", trim = FALSE) +  # Purple fill, light gray border, no trimming
  labs(title = "Violin Plot of Forbes 2000 Rank by Headquarters",
       x = "Headquarters",
       y = "Forbes 2000 Rank") +
  theme_minimal() +  # Minimal theme
  theme(
    text = element_text(family = "Arial", color = "black"),  # Font family and text color
    axis.text.x = element_text(angle = 45, hjust = 1,color = "black"),  # Adjust x-axis text angle
    panel.grid.major = element_line(color = "grey"),  # Grid color
    panel.background = element_rect(fill = "white"),  # Background color
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center the title and adjust font size
    panel.border = element_rect(color = "black", linetype = "solid", fill = NA)  # Border color
  )

