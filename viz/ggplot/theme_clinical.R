# A custom ggplot2 theme with a clinical and minimalist style.
#
# To use, save this file and then source it in your R script:
# source("path/to/theme_clinical.R")

library(ggplot2)
library(ggthemes)

# 1. COLOR PALETTE
# -----------------------------------------------------------------------------

clinical_colors <- c(
  "#3c5488",
  "#e64b35",
  "#00a087",
  "#4dbbd5",
  "#e18727"
)

# 2. CUSTOM THEME
# -----------------------------------------------------------------------------

theme_clinical <- function(base_size = 13, base_family = "sans") {
  # Start with theme_minimal() as a base and add modifications
  (theme_foundation(base_size = base_size, base_family = base_family)
  + theme(
      # General plot appearance
      plot.background = element_rect(fill = "white", colour = NA),
      plot.title = element_text(
        face = "bold",
        size = rel(1.44), # 20% larger than axis titles
        hjust = 0, # Left-align title
        margin = margin(b = 10)
      ),
      plot.subtitle = element_text(
        size = rel(1.2), # Same size as axis titles
        hjust = 0, # Left-align subtitle
        margin = margin(b = 10)
      ),
      plot.caption = element_text(
        size = rel(0.8),
        hjust = 1, # Right-align caption
        margin = margin(t = 10)
      ),

      # Panel appearance
      panel.background = element_rect(fill = "#EEEEEE", colour = "#000000"),
      panel.grid.major = element_line(colour = "grey60", linetype = "solid", linewidth = 0.5),
      panel.grid.minor = element_line(colour = "grey80", linetype = "solid", linewidth = 0.5),

      # Axis appearance
      axis.ticks = element_line(colour = "black", linetype = "solid", linewidth = 0.5), # Thin axis ticks
      axis.text = element_text(size = rel(1), colour = "black"), # Base size
      axis.title = element_text(size = rel(1.2), colour = "black"), # 20% larger than axis text

      # Legend appearance
      legend.position = "right",
      legend.background = element_rect(fill = "white", colour = NA), # Light grey background
      legend.key = element_rect(fill = "white", colour = NA), # Match panel background
      legend.title = element_text(face = "bold"),

      # Facet appearance
      strip.background = element_rect(fill = "grey90", colour = NA),
      strip.text = element_text(
        face = "bold",
        size = rel(1.1),
        margin = margin(t = 5, b = 5)
      )
    ))
}