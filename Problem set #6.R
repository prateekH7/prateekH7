# Load the required library
library(ggplot2)

# Fit a linear regression model with two independent variables
model <- lm(Petal.Length ~ Sepal.Length + Sepal.Width, data = iris)

# Create a coefficient plot
coefficients_df <- data.frame(
  Variable = names(coef(model)),
  Coefficient = coef(model),
  Std.Error = summary(model)$coefficients[, "Std. Error"]
)

# Create a coefficient plot
ggplot(coefficients_df, aes(x = Variable, y = Coefficient)) +
  geom_bar(stat = "identity", fill = "skyblue", width = 0.5) +
  geom_errorbar(aes(ymin = Coefficient - 1.96 * Std.Error,
                    ymax = Coefficient + 1.96 * Std.Error),
                width = 0.2, color = "red") +
  labs(
    title = "Coefficient Plot for Linear Regression",
    x = "Variables",
    y = "Coefficient Estimate"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
