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
  ennet_hourly_topics = get_hourly_topics(themes = ennet_themes),
  ennet_daily_topics = get_daily_topics(),
  ennet_monthly_topics = get_monthly_topics()
)


## Outputs
outputs <- tar_plan(
  hourly_topics_csv = write_hourly_topics(ennet_hourly_topics),
  daily_topics_csv = write_daily_topics(ennet_daily_topics),
  monthly_topics_csv = write_monthly_topics(ennet_monthly_topics)
)


## Reports
reports <- tar_plan(
  ##
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