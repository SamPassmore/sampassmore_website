# Install all R packages required by blog posts in posts/
# Run this script once to set up a new environment.

cran_packages <- c(
  "ape",
  "bayesplot",
  "brms",
  "dplyr",
  "emmeans",
  "faux",
  "GGally",
  "ggplot2",
  "ggpubr",
  "ggthemes",
  "knitr",
  "MCMCglmm",
  "ordinal",
  "psych",
  "rlang",
  "scholar",
  "stringr",
  "tidyr"
)

install.packages(cran_packages)

# INLA is not on CRAN — install from the r-inla.org repository
install.packages(
  "INLA",
  repos = c(getOption("repos"), INLA = "https://inla.r-inla-download.org/R/stable"),
  dep = TRUE
)

# JCRImpactFactor is a GitHub package
# This package seems to have been removed from github. 
# if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
# remotes::install_github("ikashnitsky/JCRImpactFactor")
