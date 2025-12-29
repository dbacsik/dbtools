import plotnine as p9

clinical_colors = ["#F4D58D", "#8DB4D2", "#958ED2", "#D2958E", "#8ED2C2"]

def theme_clinical(base_size=13, base_family='sans'):
    """
    A custom plotnine theme with a clinical and minimalist style.
    This theme also includes default color and fill scales using the clinical_colors palette.

    To use:
    from theme_clinical import theme_clinical
    plot + theme_clinical()
    """
    theme = p9.themes.theme_minimal(base_size=base_size, base_family=base_family) + p9.themes.theme(
        # General plot appearance
        plot_background=p9.element_rect(fill="white", colour=None),
        plot_title=p9.element_text(
            weight="bold",
            size=base_size * 1.44,
            ha="left",
            margin={'b': 10}
        ),
        plot_subtitle=p9.element_text(
            size=base_size * 1.2,
            ha="left",
            margin={'b': 10}
        ),
        plot_caption=p9.element_text(
            size=base_size * 0.8,
            ha="right",
            margin={'t': 10}
        ),

        # Panel appearance
        panel_background=p9.element_rect(fill="#EEEEEE", colour=None),
        panel_border=p9.element_rect(colour='black', fill=None, size=0.5),
        panel_grid_major=p9.element_line(colour="#999999", linetype="solid", size=0.5),
        panel_grid_minor=p9.element_line(colour="#CCCCCC", linetype="solid", size=0.5),

        # Axis appearance
        axis_ticks=p9.element_line(colour="black", linetype="solid", size=0.5),
        axis_text=p9.element_text(size=base_size, colour="black"),
        axis_title=p9.element_text(size=base_size * 1.2, weight="bold", colour="black"),

        # Legend appearance
        legend_position="right",
        legend_background=p9.element_blank(),
        legend_key=p9.element_blank(),
        legend_title=p9.element_text(weight="bold"),

        # Facet appearance
        strip_background=p9.element_rect(fill="#E5E5E5", colour=None),
        strip_text=p9.element_text(
            weight="bold",
            size=base_size * 1.1,
            margin={'t': 5, 'b': 5}
        )
    )

    scales = [
        p9.scale_color_manual(values=clinical_colors),
        p9.scale_fill_manual(values=clinical_colors)
    ]

    return [theme] + scales
