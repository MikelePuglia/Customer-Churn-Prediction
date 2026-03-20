# 📊 Customer Churn Prediction (R Project)


![image](https://github.com/user-attachments/assets/7d166c60-e7e3-4246-99ad-0fa32ce67efa)

This is an R-based Machine Learning project for predicting customer churn. It is implemented as a modular pipeline including data loading, preprocessing, exploratory analysis, modeling, and evaluation.
---

## 🚀 Objective

The goal of this project is to predict whether a customer will leave the service (churn) using an interpretable statistical model, which can help companies take proactive retention actions.
---

## 📁 Project Structure

The project is organized into separate R modules following a clear pipeline:

```
Customer-Churn-Prediction/
│
├── 01_load_data.R        # Load dataset
├── 02_preprocessing.R    # Data cleaning and transformations
├── 03_eda.R              # Exploratory Data Analysis (EDA)
├── 04_model_glm.R        # GLM model (logistic regression)
├── 05_evaluation.R       # Model evaluation
├── main.R                # Complete pipeline
└── README.md


---

## ⚙️ Project Pipeline

The workflow is fully modular:

### 1. Data Loading

* Load dataset from CSV
* Check if the file exists
* Print dataset info (dimensions, NAs, summary)

### 2. Data Preprocessing

* Remove missing values (`na.omit`)
* Convert categorical variables to **factors**
* Use `dplyr` for transformations

### 3. Exploratory Data Analysis (EDA)

* Summary statistics
* Target variable (**churn**) distribution
* Correlation matrix (numeric variables)
* Visualization with `ggplot2`

### 4. Model Training

* Model: **Generalized Linear Model (GLM)**
* Type: **Logistic Regression**
* Link function: `logit`

### 5. Model Evaluation

* Confusion Matrix
* Accuracy
* ROC Curve
* AUC (Area Under Curve)

---

## 🧠 Model Details

The main model is a logistic regression:

* Implemented with `glm()`
* Family: `binomial`
* Output: churn probability

---

## 🛠️ Technologies & Libraries

* R
* dplyr
* ggplot2
* corrplot
* pROC

---

## ▶️ How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/MikelePuglia/Customer-Churn-Prediction.git
cd Customer-Churn-Prediction
---

## 👤 Author

**Michele Puglia**
