#Acquiring Annual Peak flow from NWIS server
# Load required libraries
library(dataRetrieval)
library(readxl)
library(dplyr)

# Read station IDs from Excel 
stations_data <- read_excel("Book1 - Copy.xlsx")

# Ensure all station numbers are 8-digit strings (add leading zeros if needed)
stations_data$Station_ID <- sprintf("%08d", as.numeric(stations_data$Station_ID))

# Define start and end years
start_year <- 1991
end_year <- 2020

# Function to get peak streamflow data for a given station
get_peak_streamflow <- function(station_id) {
  tryCatch({
    peak_data <- readNWISpeak(siteNumbers = station_id)
    
    # Check if data is empty
    if (nrow(peak_data) == 0) {
      return(NULL)  # Return NULL if no data found
    }
    
    # Filter for years 1960-1990
    peak_data <- peak_data %>%
      filter(peak_dt >= as.Date(paste0(start_year, "-01-01")) & 
               peak_dt <= as.Date(paste0(end_year, "-12-31")))
    
    # Add station ID to track data source
    peak_data$station_id <- station_id
    
    return(peak_data)
  }, error = function(e) {
    message(paste("Error retrieving data for station:", station_id))
    return(NULL)  # Return NULL if an error occurs
  })
}

# Loop through all station IDs and collect data
all_peak_data <- lapply(stations_data$Station_ID, get_peak_streamflow)

# Remove NULL values and combine data into a single dataframe
all_peak_data <- bind_rows(all_peak_data)

# Save to CSV
write.csv(all_peak_data, "USGS_peak_streamflow_1990_2020.csv", row.names = FALSE)

# Flood Frequency Analysis using L-moments
library(lmomco)
library(dplyr)
library(tidyr)
# Load the data
data <- read_excel("MO_1990_2020.xlsx")
# Ensure Peak_Flow is numeric
data$Peak_Flow <- as.numeric(data$Peak_Flow)

analyze_station <- function(peak_flows, recurrence_intervals) {
  # Compute L-moments
  lmom <- lmoms(peak_flows)  # Computes L-moments
  
  # Fit Log-Pearson Type III distribution
  params <- parpe3(lmom)
  
  # Calculate exceedance probabilities
  exceedance_probs <- 1 / recurrence_intervals
  
  # Calculate flood magnitudes
  flood_magnitudes <- qlmomco(1 - exceedance_probs, params)
  
  # Return results as a data frame
  data.frame(
    Recurrence_Interval = recurrence_intervals,
    Flood_Magnitude = flood_magnitudes
  )
}
# Define recurrence intervals (in years)
recurrence_intervals <- c(2, 5, 10, 25, 50,100)

# Analyze all stations
results <- data %>%
  group_by(Station_ID) %>%
  summarize(
    Flood_Analysis = list(analyze_station(Peak_Flow, recurrence_intervals)),
    .groups = 'drop'
  ) %>%
  unnest(Flood_Analysis)  # Flatten the results
# Save the results to a CSV file
write_xlsx(results, "post_climate_rslt.xlsx")

