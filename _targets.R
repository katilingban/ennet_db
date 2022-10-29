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
  ennet_monthly_topics = get_monthly_topics(),
  ennet_discussions = get_discussions(),
  tar_target(
    name = ennet_dailies,
    command = create_db_topics_hourlies() %>%
      create_db_topics_dailies(),
    cue = tar_cue("always")
  ),
  # ennet_dailies = create_db_topics_hourlies() %>%
  #   create_db_topics_dailies(),
  daily_interactions = create_db_topics_interactions(
    ennet_dailies, id = "daily"
  ),
  weekly_interactions = create_db_topics_interactions(
    ennet_dailies, id = "weekly"
  ),
  monthly_interactions = create_db_topics_interactions(
    ennet_dailies, id = "monthly"
  ),
  yearly_interactions = create_db_topics_interactions(
    ennet_dailies, id = "yearly"
  )
)


## Outputs
outputs <- tar_plan(
  hourly_topics_csv = write_hourly_topics(ennet_hourly_topics),
  daily_topics_csv = write_daily_topics(ennet_daily_topics),
  monthly_topics_csv = write_monthly_topics(ennet_monthly_topics),
  discussions_csv = write_discussions(ennet_discussions),
  daily_interactions_csv = write.csv(
    x = daily_interactions, 
    file = "data/ennet_topics_daily_interactions.csv",
    row.names = FALSE
  ),
  weekly_interactions_csv = write.csv(
    x = weekly_interactions, 
    file = "data/ennet_topics_weekly_interactions.csv",
    row.names = FALSE
  ),
  monthly_interactions_csv = write.csv(
    x = monthly_interactions, 
    file = "data/ennet_topics_monthly_interactions.csv",
    row.names = FALSE
  ),
  yearly_interactions_csv = write.csv(
    x = yearly_interactions, 
    file = "data/ennet_topics_yearly_interactions.csv",
    row.names = FALSE
  )  
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