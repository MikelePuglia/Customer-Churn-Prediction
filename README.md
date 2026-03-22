# 📊 Customer Churn Prediction: Statistical Modeling & BI Analytics

![image](https://github.com/user-attachments/assets/7d166c60-e7e3-4246-99ad-0fa32ce67efa)

This project provides an end-to-end analysis of bank customer attrition. It combines the statistical rigor of Generalized Linear Models (GLM) in R with the visual storytelling power of Tableau to turn raw data into actionable business insights.

---

## 🚀 Objective

The goal is to predict customer churn (the probability of a customer leaving the bank) and identify the key drivers of attrition. This allows the institution to implement proactive retention strategies for high-risk segments.
---

## 📁 Project Structure

The R project is organized into modular scripts to ensure reproducibility and clarity:

---
```text
Customer-Churn-Prediction/
│
├── 00_libraries.R    # Environment setup & package loading
├── 01_load_data.R     # Data ingestion & pre-processing (NA handling, factor conversion)
├── 02_eda.R           # Exploratory Data Analysis & visual profiling
├── 03_split_data.R    # Dataset partitioning (70% Train / 30% Test)
├── 04_models.R        # GLM implementation (Logit, Probit, and Clog-log)
├── 05_predictions.R   # Odds ratios, marginal effects, and probability outputs
├── 06_validation.R    # Model evaluation (Confusion Matrix, ROC/AUC)
├── main.R             # Master script: runs the pipeline & exports Tableau-ready CSV
└── README.md
```

---

## ⚙️ Project Pipeline

### 1. Statistical Modeling (R)
* **Model Selection**: Comparative analysis of different link functions (Logit, Probit, Clog-log). The **Logit model** was selected as the best fit based on AIC/BIC criteria and Likelihood Ratio Tests.
* **Key Findings**:
    * **Age & Balance**: Older customers and those with higher account balances show a significantly higher propensity to churn.
    * **Geography**: Customers located in **Germany** have a higher churn rate compared to those in France and Spain.
    * **Engagement**: Being an **Active Member** is the strongest statistical predictor of customer loyalty.

---

### 2. Business Intelligence & Visualization (Tableau)
To bridge the gap between statistical outputs and business decision-making, the model results were integrated into an interactive dashboard.

#### 🛠️ Technical Data Engineering
Specific challenges were addressed within Tableau to ensure data integrity and usability:
* **Format Standardization**: Solved string-to-numeric conversion issues caused by locale-specific separators using `FLOAT(TRIM([field]))`.
* **Feature Engineering**:
    * **Probability Bins**: Created manual bins to visualize the density and distribution of churn risk across the customer base.
    * **Balance Segments**: Categorized customers into *Zero*, *Medium*, and *High Balance* groups to isolate specific behavioral patterns.

#### 🧩 Dashboard Insights
* **Churn Distribution**: Real-time monitoring of global churn rates versus the baseline.
* **Geographic Risk Map**: Interactive map visualizing attrition hotspots by country.
* **Behavioral Analysis**: Scatter plots (Age vs. Balance) with color-coded churn status to identify high-risk clusters.
* **Global Interactivity**: Fully dynamic filters for Gender, Country, and Activity status that update all visualizations simultaneously.

👉 **[View the Interactive Dashboard on Tableau Public](https://public.tableau.com/views/Customerchurnprediction_17741135218370/CustomerChurnAnalysisKeyDriversCountryBalanceAge?:language=it-IT&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**
---


---

## 🛠️ Technologies & Libraries

* **Language**: R (`tidyverse`, `caret`, `pROC`, `ggplot2`, `MASS`, `corrplot`)
* **BI Tool**: Tableau Desktop / Tableau Public
* **Statistical Model**: Generalized Linear Model (Binomial Logistic Regression)

---

## ▶️ How to Run the Project

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/MikelePuglia/Customer-Churn-Prediction.git](https://github.com/MikelePuglia/Customer-Churn-Prediction.git)
    cd Customer-Churn-Prediction
    ```
2.  **Open the project** in RStudio (open the `.Rproj` file if available or set the working directory).
3.  **Execute the pipeline**:
    Run the `main.R` script. This will automatically:
    * Load all necessary libraries.
    * Process the raw data.
    * Train and validate the statistical models.
    * Export the `churn_for_tableau.csv` file used for the interactive dashboard.

---

## 👤 Author

**Michele Puglia**
