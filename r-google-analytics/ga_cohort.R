# install.packages("googleAnalyticsR")
library(googleAnalyticsR)

key_path <- "Quickstart-93ce48675b3f.json"
googleAuthR::gar_auth_service(json_file = key_path)


property_id <- '356464508'


get_cohort_data <- function(property_id) {
  # Define the date range for the report
  date_range <- list(startDate = "2024-01-01", endDate = "2024-12-31")
  
  # Define the cohort requests
  cohort_requests <- list(
    cohorts = list(
      list(
        name = "Cohort 1",
        type = "FIRST_VISIT_DATE",
        dateRange = list(
          startDate = "2024-01-01",
          endDate = "2024-01-31"
        )
      ),
      list(
        name = "Cohort 2",
        type = "FIRST_VISIT_DATE",
        dateRange = list(
          startDate = "2024-02-01",
          endDate = "2024-02-28"
        )
      )
    )
  )
  
  # Define the metrics
  metrics <- list(
    list(name = "cohortTotalUsers"), 
    list(name = "cohortRetentionRate")
  )
  
  # Define the dimensions
  dimensions <- list(
    list(name = "cohort")
  )
  
  # Create the request body
  request_body <- list(
    dateRanges = list(date_range),
    metrics = metrics,
    dimensions = dimensions,
    cohortSpec = cohort_requests
  )
  
  # Fetch the cohort data
  cohort_data <- googleAnalyticsR::google_analytics(
    property_id,
    date_range = date_range,
    metrics = c("cohortTotalUsers", "cohortRetentionRate"),
    dimensions = c("cohort"),
    cohort = cohort_requests
  )
  
  return(cohort_data)
}

# Fetch the cohort data
cohort_data <- get_cohort_data(property_id)
print(cohort_data)