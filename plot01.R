

dose <- c(20, 30, 40, 45, 60)
drugA <-c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

drugs <-data.frame(dose, drugA, drugB)

plot(drugs, col = "blue")

attach(drugs)

plot(dose)
plot(dose, type ="o", col = "blue") 

# plot against

plot(dose, drugB, type ="b", col = "blue") 

plot(drugB, dose, type ="b", col = "blue") 

plot(drugB, dose, type ="b", col = "blue") 


# par function - parameters of a graph
# grabs default setup and saves it so default can be restored without restarting rstudio
opar = par(no.readonly = TRUE)

# lty - line type - 2 = dashed
# pch - point type - 17 = solid triangle
par(lty = 2, pch = 17)

plot(drugB, dose, type ="b") 

plot(drugB, dose, type ="b") 

par(opar)

plot(drugB, dose, type ="b") 
