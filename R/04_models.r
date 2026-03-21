# Logit
bank.fit <- glm(formula = churn ~ ., family = binomial(link = "logit"), data = train)
summary(bank.fit)

bank.fit2 <- glm(churn ~ country + gender + age + tenure + balance + active_member,
                 family = binomial(link="logit"), data = train)
summary(bank.fit2)

anova(bank.fit, bank.fit2, test = "LRT")
BIC(bank.fit, bank.fit2)
AIC(bank.fit, bank.fit2)

# Clog-log
bank.fit.clog <- glm(churn ~ ., family = binomial(link = "cloglog"), data = train)
summary(bank.fit.clog)

bank.fit.clog.2 <- glm(churn ~ country + gender + age + tenure + balance + active_member,
                       family = binomial(link = "cloglog"), data = train)
anova(bank.fit.clog, bank.fit.clog.2, test = "LRT")

# Probit
bank.fit.probit <- glm(churn ~ ., family = binomial(link="probit"), data = train)
summary(bank.fit.probit)

bank.fit.probit2 <- glm(churn ~ country + gender + age + balance + active_member,
                        family = binomial(link="probit"), data = train)
anova(bank.fit.probit, bank.fit.probit2, test = "LRT")

# Confronto AIC/BIC
matrix_AIC_BIC <- matrix(c(
  AIC(bank.fit2), AIC(bank.fit.probit2), AIC(bank.fit.clog.2),
  BIC(bank.fit2), BIC(bank.fit.probit2), BIC(bank.fit.clog.2)
), 2, 3, byrow=TRUE)
rownames(matrix_AIC_BIC) <- c("AIC","BIC")
colnames(matrix_AIC_BIC) <- c("logit","probit","loglog")
matrix_AIC_BIC
