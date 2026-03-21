# main.R
source("R/00_libraries.R")
source("R/01_load_data.R")
source("R/02_eda.R")
source("R/03_split_data.R")
source("R/04_models.R")
source("R/05_predictions.R")
source("R/06_validation.R")

# --------------------------------------------
# Salvataggio dataset per Tableau
# --------------------------------------------
# Aggiungiamo la colonna con la predizione finale
# Qui usiamo le stesse predizioni calcolate in predictions.R
train_pred <- predict(bank.fit2, train, type="response")
test_pred  <- predict(bank.fit2, test, type="response")

# Creiamo dataframe completo con predizione
train_tableau <- cbind(train, predicted_churn = train_pred)
test_tableau  <- cbind(test, predicted_churn = test_pred)

# Uniamo train e test
bank_tableau <- rbind(train_tableau, test_tableau)

# Salviamo in CSV per Tableau
write.table(bank_tableau,
            "churn_for_tableau.csv",
            sep = ",",
            dec = ".",
            row.names = FALSE,
            quote = FALSE)

cat("Dataset con predizioni salvato in churn_for_tableau.csv\n")
