# ============================================
# 03_eda.R
# ============================================
# Functions for Exploratory Data Analysis (EDA)
# ============================================

eda_summary <- function(df) {
  cat("=== Summary statistics ===\n")
  print(summary(df))
  
  if("churn" %in% names(df)) {
    cat("\n=== Churn distribution ===\n")
    print(df %>% dplyr::count(churn) %>% dplyr::mutate(proportion = n/sum(n)))
  }
  
  # Correlation plot for numeric variables
  num_data <- df %>% dplyr::select_if(is.numeric)
  if(ncol(num_data) > 1) {
    corrplot::corrplot(cor(num_data), type="upper", method="number", tl.srt=45)
  }
}

plot_churn_distribution <- function(df) {
  if(!"churn" %in% names(df)) stop("Column 'churn' not found")
  
  ggplot(df, aes(x = churn, fill = churn)) +
    geom_bar() +
    scale_fill_manual(values = c("steelblue", "orange")) +
    theme_classic() +
    labs(title = "Churn Distribution")
}
