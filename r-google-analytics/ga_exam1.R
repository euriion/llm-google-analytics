install.packages("googleAnalyticsR")
library(googleAnalyticsR)

# Set the path to your service account key file
key_path <- "Quickstart-93ce48675b3f.json"

# Set the GA4 property ID
property_id <- '356464508'

# Authenticate using the service account key
ga_auth(json_file = key_path)

# Define the date range
start_date <- "2024-01-01"
end_date <- "2024-12-31"

# Create a request to get GA4 data
ga_data <- ga_data(
  propertyId = property_id,
  date_range = c(start_date, end_date),
  metrics = c("sessions", "totalUsers"),
  dimensions = c("date")
)

# Display the data
print(ga_data)

# convert the data to a data frame
ga_data_df <- as.data.frame(ga_data)

# save to ga_exam1.csv

write.csv(ga_data_df, "ga_exam1.csv", row.names = FALSE)



