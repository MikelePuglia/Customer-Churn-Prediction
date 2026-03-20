# 📊 Customer Churn Prediction (R Project)

Progetto di Machine Learning in **R** per la previsione del churn dei clienti (abbandono), sviluppato con una pipeline modulare che include caricamento dati, preprocessing, analisi esplorativa, modellazione e valutazione.

---

## 🚀 Obiettivo

L’obiettivo è prevedere se un cliente abbandonerà il servizio (**churn**) utilizzando un modello statistico interpretabile, utile per strategie di retention.

---

## 📁 Struttura del progetto

Il progetto è organizzato in moduli R separati, seguendo una pipeline chiara:

```
Customer-Churn-Prediction/
│
├── 01_load_data.R        # Caricamento dataset
├── 02_preprocessing.R   # Pulizia e trasformazioni
├── 03_eda.R             # Analisi esplorativa (EDA)
├── 04_model_glm.R       # Modello GLM (logistic regression)
├── 05_evaluation.R      # Valutazione modello
├── main.R               # Pipeline completa
└── README.md
```

---

## ⚙️ Pipeline del progetto

Il workflow è completamente modulare:

### 1. Data Loading

* Caricamento dataset da CSV
* Controllo esistenza file
* Output informativo (dimensioni, NA, summary)

### 2. Data Preprocessing

* Rimozione valori mancanti (`na.omit`)
* Conversione variabili categoriche in **factor**
* Utilizzo di `dplyr` per trasformazioni

### 3. Exploratory Data Analysis (EDA)

* Statistiche descrittive
* Distribuzione della variabile target (**churn**)
* Matrice di correlazione (variabili numeriche)
* Visualizzazione con `ggplot2`

### 4. Model Training

* Modello: **Generalized Linear Model (GLM)**
* Tipo: **Logistic Regression**
* Link function: `logit`

### 5. Model Evaluation

* Confusion Matrix
* Accuracy
* ROC Curve
* AUC (Area Under Curve)

---

## 🧠 Modello utilizzato

Il modello principale è una regressione logistica:

* Implementata con `glm()`
* Famiglia: `binomial`
* Output: probabilità di churn

---

## 🛠️ Tecnologie e librerie

* R
* dplyr
* ggplot2
* corrplot
* pROC

---

## ▶️ Come eseguire il progetto

1. Clona la repository:

```bash
git clone https://github.com/MikelePuglia/Customer-Churn-Prediction.git
cd Customer-Churn-Prediction
```

2. Apri R o RStudio

3. Installa le librerie necessarie:

```r
install.packages(c("dplyr", "ggplot2", "corrplot", "pROC"))
```

4. Modifica il path del dataset in `main.R`:

```r
df <- load_data("path/to/your/dataset.csv")
```

5. Esegui la pipeline:

```r
source("main.R")
```

---

## 📊 Output del progetto

Il progetto produce:

* Statistiche descrittive
* Grafici EDA
* Modello GLM addestrato
* Confusion matrix
* Accuracy
* ROC curve + AUC

---

## 👤 Autore

**Michele Puglia**
