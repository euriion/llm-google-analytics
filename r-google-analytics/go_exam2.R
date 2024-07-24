# install.packages("googleAnalyticsR")
library(googleAnalyticsR)

# Set the path to your service account key file
key_path <- "Quickstart-93ce48675b3f.json"

# Set the GA4 property ID
property_id <- '356464508'

# Authenticate using the service account key
ga_auth(json_file = key_path)

# Define the date range
date_ranges <- c("92daysAgo", "today")

# Create a request to get GA4 data
ga_data <- ga_data(
  propertyId = property_id,
  date_range = date_ranges,
  metrics = "sessions",
  dimensions = "date"
)

# Display the data
print(ga_data)

# Extract and print the results
for (i in 1:nrow(ga_data)) {
  print(paste("Date:", ga_data$date[i], ", Sessions:", ga_data$sessions[i]))
}

# install.packages("googleAnalyticsR")
library(googleAnalyticsR)

# Set the path to your service account key file
key_path <- "Quickstart-93ce48675b3f.json"

# Set the GA4 property ID
property_id <- '356464508'

# Authenticate using the service account key
ga_auth(json_file = key_path)

# Define the date range
date_ranges <- c("92daysAgo", "today")

# Create a request to get GA4 data
ga_data <- ga_data(
  propertyId = property_id,
  date_range = date_ranges,
  metrics = "sessions",
  dimensions = "date"
)

print(ga_data)

for (i in 1:nrow(ga_data)) {
  print(paste("Date:", ga_data$date[i], ", Sessions:", ga_data$sessions[i]))
}

ga_data_df <- as.data.frame(ga_data)

library(ggplot2)
windows()
ggplot(ga_data_df, aes(x = date, y = sessions)) +
  geom_line() +
  labs(title = "Sessions by Date",
       x = "Date",
       y = "Sessions") +
  theme_minimal()
