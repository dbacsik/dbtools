# theme_clinical.py
from plotnine import theme_bw, theme, element_text

palette_clinical = [
    "#F4D58D",
    "#8DB4D2",
    "#958ED2",
    "#D2958E",
    "#8ED2C2"
    ]

def theme_clinical(base_size=11):
    """
    Custom theme built on theme_bw.

    Args:
        base_size: Base font size
    Returns:
        A plotnine theme object with custom styling and color scales.
    """
    return (
        theme_bw(base_size=base_size) +  # Start with minimal
        theme(
            text=element_text(size=base_size, color='#000'),
            plot_title=element_text(size=base_size * 1.4, weight='bold'),
            axis_title=element_text(size=base_size * 1.2),
            axis_text=element_text(size=base_size * 1)
        )
    )