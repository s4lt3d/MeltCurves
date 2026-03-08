# Melt Curves with Reference

> An interactive Shiny app (R) for exploring melt curve data and visualizing how multiple curves combine.

---

## Screenshots

![Melt Curves Screenshot](https://github.com/s4lt3d/MeltCurves/blob/master/screenshot.jpg?raw=true)

---

## Overview

This Shiny application allows you to interactively work with melt curve data, visualizing how temperature-dependent melting curves combine and interact. Useful for thermal analysis, DNA melting studies, and scientific data exploration.

---

## Features

- **Interactive Curve Visualization** — Real-time plot updates as parameters change
- **Multi-curve Analysis** — Compare and combine multiple melt curves
- **Data Exploration** — Adjust curve parameters and observe results
- **Reference Data** — Built-in reference curves for comparison
- **Export Capabilities** — Save plots and data for further analysis

---

## Getting Started

### Requirements

- R 3.5+
- RStudio (recommended)
- R packages: `shiny`, `ggplot2`, `dplyr`

### Installation

```r
# Install required packages
install.packages(c("shiny", "ggplot2", "dplyr"))
```

### Usage

Run the Shiny app through RStudio:
```r
shiny::runApp()
```

Or from the command line:
```bash
Rscript -e "shiny::runApp('.')"
```

---

## Application

This tool is useful for:
- **DNA Melting Analysis** — Studying thermal stability of DNA sequences
- **Protein Stability** — Analyzing thermal transitions
- **Chemical Reactions** — Exploring temperature-dependent processes
- **Data Comparison** — Overlaying and comparing melt profiles

---

## Technical Details

- **Framework:** Shiny (R web application framework)
- **Visualization:** ggplot2 for high-quality plots
- **Data Handling:** dplyr for efficient data manipulation
- **Interactive:** Real-time reactive updates

---

## License

Copyright © Walter Gordy
