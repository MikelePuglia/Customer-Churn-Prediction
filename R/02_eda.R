# Analisi descrittiva
glimpse(bank)
summary(bank)

# Visualizzazione churn
bank %>%
  count(churn) %>%
  mutate(proportion = n / sum(n)) %>%
  rename(churn = churn, proportion = proportion) %>%
  print()

ggplot(bank, aes(x = churn, fill = churn)) +
  geom_bar() +
  labs(title = "Distribuzione di 'churn'",
       x = "Churn",
       y = "Conteggio") +
  scale_fill_manual(values = c("steelblue", "orange"))+
  theme_classic()

# Gender e country rispetto a churn
bar_gender_churn <- ggplot(bank, aes(x = gender, fill = churn)) +
  geom_bar(position = "stack", stat = "count") +  
  labs(title = "Distribuzione Churn per Gender",
       x = "Gender",
       y = "Conteggio") +
  scale_fill_manual(values = c("steelblue", "orange"),
                    name = "Churn",
                    labels = c("No Churn", "Churn"))

bar_country_churn <- ggplot(bank, aes(x = country, fill = churn)) +
  geom_bar(position = "stack", stat = "count") +
  labs(title = "Distribuzione Churn-Country",
       x = "Country",
       y = "Conteggio") +
  scale_fill_manual(values = c("steelblue", "orange"),
                    name = "Churn",
                    labels = c("No Churn", "Churn"))

grid.arrange(bar_gender_churn, bar_country_churn, ncol = 2)

# Active member e credit card
bar_active_churn <- ggplot(bank, aes(x = active_member, fill = churn)) +
  geom_bar(position = "stack", stat = "count") +
  labs(title = "Distribuzione Churn-Active_member",
       x = "Active_member",
       y = "Conteggio") +
  scale_fill_manual(values = c("steelblue", "orange"),
                    name = "Churn",
                    labels = c("No Churn", "Churn"))

bar_creditcard_churn <- ggplot(bank, aes(x = credit_card, fill = churn)) +
  geom_bar(position = "stack", stat = "count") +
  labs(title = "Distribuzione Churn-credit_card",
       x = "Credit_card",
       y = "Conteggio") +
  scale_fill_manual(values = c("steelblue", "orange"),
                    name = "Churn",
                    labels = c("No Churn", "Churn"))

grid.arrange(bar_active_churn, bar_creditcard_churn, ncol = 2)

# Age
hist_age <- ggplot(bank, aes(x = age, fill = churn)) +
  geom_histogram(binwidth = 1, color = "black", position = "identity", alpha = 0.7) +
  scale_fill_manual(values = c("steelblue", "orange")) +
  labs(title = "Distribuzione di Age") +
  xlab("Age") +
  ylab("Frequenza")

bp_age <- ggplot(bank, aes(x = "", y = age)) +
  geom_boxplot(fill="steelblue") +
  labs(title = "Boxplot di Age",
       x = "",
       y = "Age")

grid.arrange(hist_age, bp_age, ncol = 2)

# Balance
hist_balance <- ggplot(bank, aes(x = balance, fill = churn)) +
  geom_histogram(binwidth = 10000, color = "black", position = "identity", alpha = 0.7) +
  scale_fill_manual(values = c("steelblue", "orange")) +
  labs(title = "Distribuzione di balance") +
  xlab("balance") +
  ylab("Frequenza") +
  scale_x_continuous(labels = scales::comma_format(scale = 1, suffix = ""))

bp_balance <- ggplot(bank, aes(x = "", y = balance)) +
  geom_boxplot(fill="steelblue") +
  labs(title = "Boxplot di balance",
       x = "",
       y = "balance")

grid.arrange(hist_balance, bp_balance, ncol = 2)

# Credit score
hist_score <- ggplot(bank, aes(x = credit_score, fill=churn)) + 
  geom_histogram(binwidth = 50, color = "black", position = "identity", alpha = 0.7) +
  scale_fill_manual(values = c("steelblue", "orange")) +
  labs(title = "Distribuzione Credit Score")

bp_score <- ggplot(bank, aes(x = "", y = credit_score)) +
  geom_boxplot(fill="steelblue") +
  labs(title = "Boxplot di credit_score",
       x = "",
       y = "credit_score")

grid.arrange(hist_score, bp_score, ncol = 2)

# Scatterplots
sp1 <- ggplot(subset(bank, balance != 0), aes(x = age, y = balance, color= churn)) +
  geom_point() +
  labs(title = "Scatterplot Age-balance", x = "Age", y = "balance") +
  scale_color_manual(values = c("steelblue", "orange"), name = "Churn", labels = c("No Churn", "Churn"))
sp1_density <- sp1 + geom_density2d(color = "white")
sp1_density

sp2 <- ggplot(bank, aes(x = age, y = credit_score, color = churn)) +
  geom_point() +
  labs(title = "Scatterplot age-score", x = "age", y = "score") +
  scale_color_manual(values = c("steelblue", "orange"), name = "Churn", labels = c("No Churn", "Churn"))
sp2_density <- sp2 + geom_density2d(color = "white")
sp2_density

# Correlazione
num_data <- bank %>% select_if(is.numeric)
corrplot(cor(num_data), type = "upper", tl.srt = 45, tl.cex = 0.7, method = "number")
