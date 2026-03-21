# Lettura dataset
bank <- read.csv(path, header = TRUE)

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
