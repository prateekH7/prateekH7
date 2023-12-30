# Define a color palette
colors <- c("blue", "red")

# Publication-quality plot
pub_quality_plot <- ggplot(data = lawschools, aes(x = year)) +
  geom_line(aes(y = fy_male), color = colors[1], linetype = "solid") +
  geom_line(aes(y = fy_female), color = colors[2], linetype = "solid") +
  labs(
    x = "Year",
    y = "Enrollment",
    color = "Gender",
    title = "First-Year U.S. Law School Enrollment by Gender",
    subtitle = "Temporal Trends (1963-2015)",
    caption = "Source: lawschools dataset"
  ) +
  scale_color_manual(values = colors) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 14, face = "italic"),
    legend.position = "top",
    legend.title = element_blank(),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank()
  )

# Display the publication-quality plot
print(pub_quality_plot)
