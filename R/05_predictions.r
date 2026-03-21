# Coefficienti e intervalli
ci <- confint(bank.fit2)
betaHat <- coef(bank.fit2)
cbind(betaHat, ci)
cbind(exp(betaHat), exp(ci))

# Predizioni nuovi clienti
new.customers <- with(bank, data.frame(
  gender = c("Male","Female"),
  country = "Germany",
  age = rep(round(mean(age),0)),
  tenure = rep(round(mean(tenure),0)),
  balance = rep(mean(balance),2),
  active_member = c("1","1")
))
predict(bank.fit2, newdata = new.customers, type = "response")

new.customers2 <- with(bank, data.frame(
  gender = "Male",
  country = "Spain",
  age = 40,
  tenure = 5,
  balance = rep(mean(balance),2),
  active_member = c("0","1")
))
predict(bank.fit2, newdata = new.customers2, type = "response")

new.customers3 <- with(bank, data.frame(
  gender = rep(c("Male","Female"),50,replace = TRUE),
  country = rep("Spain",50),
  age = rep(35,50),
  tenure = rep(6,50),
  balance = runif(50,30000,150000),
  active_member = rep("1",50)
))
new.customers3$Prediction <- predict(bank.fit2, newdata=new.customers3, type="response")

new.customers4 <- cbind(new.customers3, predict(bank.fit2, newdata=new.customers3, type="link", se=TRUE))
new.customers5 <- within(new.customers4, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - (1.96*se.fit))
  UL <- plogis(fit + (1.96*se.fit))
})
ggplot(new.customers5, aes(x=balance, y=PredictedProb)) +
  geom_ribbon(aes(ymin=LL, ymax=UL, fill=gender), alpha=0.2) +
  geom_line(aes(colour=gender), size=1)

# Marginal effects
pred.1 <- ggpredict(bank.fit2, "age [40:50]")
plot(pred.1)
pred.4 <- ggpredict(bank.fit2, "balance[50000:90000]")
plot(pred.4)
