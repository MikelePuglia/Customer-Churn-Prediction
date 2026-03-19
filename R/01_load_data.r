# ============================================
# 01_load_data.R
# ============================================
# Function: load_data()
# Description:
#   Loads a CSV dataset into R, checks if the file exists,
#   prints dimensions, number of NA values, glimpse, and summary.
# Input:
#   path - full or relative path to the CSV file
# Output:
#   dataframe with the dataset
# ============================================

load_data <- function(path) {
  # Check if file exists
  if (!file.exists(path)) {
    stop("File not found: ", path)
  }
  
  # Load dataset
  data <- read.csv(path, header = TRUE, stringsAsFactors = FALSE)
  
  # Print info
  cat("✅ Dataset loaded successfully!\n")
  cat("Dimensions:", dim(data)[1], "rows x", dim(data)[2], "columns\n")
  cat("NA values:", sum(is.na(data)), "\n")
  
  # Show glimpse and summary
  if (requireNamespace("dplyr", quietly = TRUE)) {
    dplyr::glimpse(data)
  }
  summary(data)
  
  return(data)
}
