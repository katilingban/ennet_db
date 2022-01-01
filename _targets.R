################################################################################
#
# Project build script
#
################################################################################

# Load packages (in packages.R) and load project-specific functions in R folder
suppressPackageStartupMessages(source("packages.R"))
for (f in list.files(here::here("R"), full.names = TRUE)) source (f)


# Set build options ------------------------------------------------------------



# Groups of targets ------------------------------------------------------------

## Data
data <- tar_plan(
  ennet_themes = ennet::get_themes(),
  ennet_topics = get_hourly_topics(themes = ennet_themes)
)


## Outputs
outputs <- tar_plan(
  hourly_topics_csv = write_hourly_topics(hourly_topics = ennet_topics)
)


## Reports
reports <- tar_plan(

)

## Deploy targets
deploy <- tar_plan(
  ##
)

## Set seed
set.seed(1977)

# Concatenate targets ----------------------------------------------------------
list(
  data,
  outputs,
  reports,
  deploy
)