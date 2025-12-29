# A custom ggplot2 theme with a clinical and minimalist style.
#
# To use:
# source("path/to/theme_clinical.R")
#
# This will automatically:
# 1. Load required libraries (ggplot2, ggthemes)
# 2. Set theme_clinical() as the default theme
# 3. Set clinical_colors as the default discrete color/fill scale

library(ggplot2)
library(ggthemes)

# 1. COLOR PALETTE
# -----------------------------------------------------------------------------

clinical_colors <- c(
  "#F4D58D", "#8DB4D2", "#958ED2", "#D2958E", "#8ED2C2"
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
        size = rel(1.44), 
        hjust = 0, 
        margin = margin(b = 10)
      ),
      plot.subtitle = element_text(
        size = rel(1.2), 
        hjust = 0, 
        margin = margin(b = 10)
      ),
      plot.caption = element_text(
        size = rel(0.8),
        hjust = 1, 
        margin = margin(t = 10)
      ),

      # Panel appearance
      panel.background = element_rect(fill = "#EEEEEE", colour = "#000000"),
      panel.grid.major = element_line(colour = "grey60", linetype = "solid", linewidth = 0.5),
      panel.grid.minor = element_line(colour = "grey80", linetype = "solid", linewidth = 0.5),

      # Axis appearance
      axis.ticks = element_line(colour = "black", linetype = "solid", linewidth = 0.5), 
      axis.text = element_text(size = rel(1), colour = "black"), 
      axis.title = element_text(size = rel(1.2), colour = "black"), 

      # Legend appearance
      legend.position = "right",
      legend.background = element_rect(fill = "white", colour = NA), 
      legend.key = element_rect(fill = "white", colour = NA), 
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

# 3. SET DEFAULTS (EXECUTES ON SOURCE)
# -----------------------------------------------------------------------------

# Set the theme as default
theme_set(theme_clinical())

# Overwrite default discrete color scales in the global environment
# This allows you to use your custom palette without adding scale_color_manual() every time.
assign("scale_colour_discrete", function(..., values = clinical_colors) scale_colour_manual(..., values = values), envir = globalenv())
assign("scale_fill_discrete", function(..., values = clinical_colors) scale_fill_manual(..., values = values), envir = globalenv())

# Confirmation message
message("theme_clinical loaded. Default theme and color scales updated.")