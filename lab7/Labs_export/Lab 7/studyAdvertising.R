#Goal: (1) Study how TV advertising spending relates to sales of a product
#      (2) Study how Radio advertising costs relates to sales of a product


#adData = read.csv(file="Advertising.csv", header=TRUE, sep=",")
credit         = read.csv(file="Credit.csv", header=TRUE,sep=",")

#plot(adData$TV,adData$Sales, main = "Total Sales Related to TV Advertising",xlab="TV Spending",ylab="Total Sales")

#plot(adData$Radio,adData$Sales, main = "Total Sales Related to Radio Advertising",xlab="Radio Spending",ylab="Total Sales")

#plot(adData$TV, adData$Sales, main = "TV vs Sales", xlab = "TV Sales" , ylab = "Total Sales", col = c("Blue","Red"))

#plot(adData$Newspaper, adData$Sales, main = "Newspaper vs Sales", xlab = "Newspaper Sales" , ylab = "Total Sales", col = c("Blue","Red"))


boxplot(Credit$Cards, Credit$Gender, main = "Cards Vs Gender", names = c("Male", "Female"),
        col = c("orange", "red"))
plot(Credit$Income , Credit$Age, main = "Income Vs Age", xlab = "Income", ylab = "Age", col = c("Blue", "Red"))
#scatterplot(Credit$Income, Credit$Gender, main = "Income vs Age", xlab = "Income", ylab = "Age", col = c("Blue", "Red") )