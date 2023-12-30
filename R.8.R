# Create a publication-quality plot
ggplot(data = lawschools, aes(x = year)) +
  geom_line(aes(y = fy_male), color = "blue", linetype = "solid", size = 1, group = 1) +
  geom_line(aes(y = fy_female), color = "red", linetype = "solid", size = 1, group = 2) +
  labs(
    x = "Year",
    y = "Enrollment",
    title = "First-Year U.S. Law School Enrollment by Gender",
    color = "Gender"
  ) +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal() +
  theme(
    text = element_text(family = "Arial", size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 12)
  )
