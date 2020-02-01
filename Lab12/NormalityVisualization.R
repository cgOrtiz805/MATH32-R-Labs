#Load the data 

example      = c(3,4,5,5,6,6,7,8,14,10,9,11,15,34,21,1,5,4,2,1)
quiz         = read.csv(file="quizscores.csv", header=TRUE,sep=",")
lions        = read.csv(file="lions.csv", header=TRUE,sep=",")


#####################################
#  Visualize the distributions      #
#####################################

#par(mfrow=c(1,2))
plot(density(quiz$Scores,bw=5),main = "Kernel density QuizF")
qqnorm(quiz$Scores,main="Quantile-QuantileQuizt")
qqline(quiz$Scores)

#plot(density(lions$Weight,bw=5),main = "Kernel density LION")
#qqnorm(lions$Weight,main="Quantile-Quantile LION")
#qqline(lions$Weight)
