# Lettura dataset
bank <- read.csv("C:/Users/pugli/OneDrive/Desktop/Customer_Churn_Prediction/Bank Customer Churn Prediction.csv", header = TRUE)

# Conversione di tipo
bank <- bank %>%
  mutate(
    churn = as.factor(churn),
    country = as.factor(country),  
    gender = as.factor(gender),
    active_member = as.factor(active_member),
    credit_card = as.factor(credit_card)
  )

# Controllo valori mancanti
anyNA(bank)
