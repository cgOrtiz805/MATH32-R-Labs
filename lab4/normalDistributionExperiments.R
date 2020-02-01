#Goal: Answer the following questions:

#Given: 
# A manufacturer is producing a ¾ -inch threaded rod. It is determined that the 
# diameter of the rod follows a N(0.75,0.001) distribution.

mu    = 0;
sigma = 7.412;




##########
# Part A #
##########

# If the manufacture must throw out any rod that is not within 0.0014” of  0.75”, 
# determine the percentage of the rods that will be discarded.

#tolerance = 0.0014;

#Integrate the PDF for x > (mu + tolerance) (Upper Tail)
#upperTail = pnorm(35, mean=mu, sd=sigma, lower.tail=FALSE);
#cat("P(X > 35) ", " = ",upperTail,"\n")

#Integrate the PDF for x < (mu - tolerance) (Lower Tail)
#lowerTail = pnorm(4, mean=mu, sd=sigma, lower.tail=FALSE);
#cat("P(X<4) ", " = ",lowerTail,"\n")


#Integrate the PDF for x > (mu + tolerance) (Upper Tail)
#upperTail = pnorm(16.2, mean=mu, sd=sigma, lower.tail=TRUE);
#cat("P(X > 16.2) ", " = ",upperTail,"\n")

#Integrate the PDF for x < (mu - tolerance) (Lower Tail)
#lowerTail = pnorm(27.5, mean=mu, sd=sigma, lower.tail=TRUE);
#cat("P(X<27.5) ", " = ",lowerTail,"\n")

#Integrate the PDF for x > (mu + tolerance) (Upper Tail)
upperTail = pnorm(-5, mean=mu, sd=sigma, lower.tail=TRUE);
cat("P(X > -5) ", " = ",upperTail,"\n")

#Integrate the PDF for x < (mu - tolerance) (Lower Tail)
lowerTail = pnorm(5, mean=mu, sd=sigma, lower.tail=TRUE);
cat("P(X<5) ", " = ",lowerTail,"\n")




#Sum together for the total probability
totalFailureProb = upperTail + lowerTail;
cat("P(|X - mu| < tolerance) ", " = ",totalFailureProb,"\n")

##########
# Part B #
##########

# Management wants to bring waste under 5%. 
# What standard deviation must be attained to make this happen?

maxError = 0.05;

# Soln: Let's make the standard deviation a variable 
#       and plot our error as a function of it.

numSamples  = 20;
sVals       = seq(0.0001, 0.001, length.out = numSamples)
errorProb   = 0*c(1:numSamples)

for (j in seq(from=1,to=numSamples,by=1))
{
  sigma = sVals[j];
  upperTail = pnorm(mu + tolerance, mean=mu, sd=sigma, lower.tail=FALSE);
  lowerTail = pnorm(mu - tolerance, mean=mu, sd=sigma, lower.tail=TRUE);
  errorProb[j] = upperTail + lowerTail;
}

plot(sVals,errorProb)
lines(c(sVals[1],sVals[numSamples]),c(maxError,maxError),col='red')
