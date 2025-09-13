#!/usr/bin/env Rscript

# Install Quarto if not installed
if(!require("quarto")){
  install.packages("quarto")
}

library(quarto)

# Check Quarto installation
if(!quarto::quarto_binary_sitrep()){
  stop("Something is wrong with your Quarto installation.")
}

# Render the entire site
quarto::quarto_render(".")

# Stage the rendered HTML files
system("git add docs/*")

# Exit R without saving workspace
if(!any(grepl("rstudio", search()))){q("no")}
