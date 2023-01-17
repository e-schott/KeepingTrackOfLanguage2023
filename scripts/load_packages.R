# this loads all needed packages for

# Package requirements and helper function(s) for Manuscript"Keeping track of language: Can monolingual and bilingual infants associate a speaker with the language they speak?"
### Written by Esther Schott

# Install groundhog package if necessary
if (!"groundhog" %in% rownames(installed.packages())) install.packages("groundhog")
library(groundhog)

# packages used

packages_used <- c(
  "rmarkdown", "codebook", "labelled", "devtools",
  "pander", "knitr", "forcats", "beepr",
  "anytime", "apaTables", "arsenal", "broom", "diffdf", "dplyr", "data.table",
  "eyetrackingR", "ez", "forcats", "ggbeeswarm", "ggplot2", "glue",
  "here", "janitor", "lme4", "lubridate", "magrittr",
  "Matrix", "PupillometryR", "purrr", "RColorBrewer",
  "readr", "readxl", "rio", "rlang", "stringr", "tibble",
  "tidyr", "tidylog", "TOSTER", "zoo"
) # used sessionInfo()$otherPkgs %>% names() %>% dput() to create this

# date last updated
date_updated <- "2022-03-20"

# load packages
groundhog.library(pkg = packages_used, date = date_updated)


# load packages that are on github only

# deal with github only packages
# Install packages only if necessary
if (!"papaja" %in% rownames(installed.packages())) devtools::install_github("crsh/papaja")
if (!"citr" %in% rownames(installed.packages())) devtools::install_github("crsh/citr")
if (!"introdataviz" %in% rownames(installed.packages())) devtools::install_github("psyteachr/introdataviz")


library(papaja)
library(citr)
library(introdataviz)

#### project-specific helper functions
# helper functions
# create function to get human readable non-latex code for results
convert_anova_to_apa_text <- function(input) {
  latex_result_table <- apa_print(input[["aov"]], in_paren = TRUE, es = "pes")
  latex_result_list <- latex_result_table$full_result
  latex_result_list %>%
    lapply(., function(x) gsub("\\$", "", x)) %>%
    lapply(., function(x) gsub("\\\\mathit\\{MSE\\}", "MSE", x)) %>%
    lapply(., function(x) gsub("\\\\hat\\{\\\\eta\\}\\^2_p", "eta2p", x))
}
