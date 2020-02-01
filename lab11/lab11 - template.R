#Poisson Random Variable Simulation 


poissonmean <- 120 #<-- U =120 , H = 15, M = .25
maxSamples = 100 # CHANGED BETWEEN 100, 10000, 100000 
#<-- Will change based on the simulation choices
threshold = 1 #<-- The process will stop generating arrivals after this value


par(mfrow=c(1,2))    # set the plotting area into a 1*2 array
#x <- seq(minX,maxX,0.1)
#plot(x, integrand(x),type = 'l',
#     col='black',main="f(x) = 3 x^2 + 1",ylab="f(x)")


####################################################
# Ensure enough inter-arrival values are generated #
####################################################

samplestogenerate=floor(10*threshold*max(poissonmean,1))


#############################################
# Simulate the arrival intervals, then count #
# number required to pass the threshhold     #
##############################################
outcomes=rep(0,maxSamples)
averages=rep(0,maxSamples)

for (j in seq(from=1,to=maxSamples,by=1))
{
  
  arrivalintervals = rexp(samplestogenerate,poissonmean)
  
  poissontotal=arrivalintervals[1]

if(poissontotal > threshold) 
{
  outcomes[j]=0
} else
{
    while(poissontotal<threshold)
    {
      outcomes[j]=outcomes[j]+1
      poissontotal=poissontotal+arrivalintervals[outcomes[j]+1]
      
    }
}  
  
#Compute an average of all outcomes of the experiment at each stage  
  averages[j]=mean(outcomes[1:j])
}


#Display the mean value of the Poisson random variable over all simulations
cat("Observed mean value of the Poisson R.V. in a simulation with",maxSamples,  "data points = ",averages[maxSamples],"\n")
cat("Proportion of the observed values of the Poisson R.V. below the mean in a simulation with",maxSamples,  "data points = ",length(outcomes[outcomes<=poissonmean])/maxSamples,"\n")




#Plot the evolution of the averages

plot(seq(from=1,to=maxSamples,by=1),averages,type='l',col='black',
      xlab="Number of simulations",ylab="Mean Poisson value",
     main="Mean of Poisson simulations")
lines(seq(from=1,to=maxSamples,by=1),rep(poissonmean,maxSamples),col='blue')

#####################################################################
# Plot one set of simulated arrival times up to the threshold value #
#####################################################################


arrivalintervals = rexp(samplestogenerate,poissonmean)

poissontimetotal=0
outcome=0

if(arrivalintervals[1]>threshold)
{
  outcome=0
} else

{
 while(poissontimetotal<threshold)
  {
    outcome=outcome+1
    poissontimetotal=poissontimetotal+arrivalintervals[outcome+1]
  }
}

if(outcome==0)
{
  plot(c(0,threshold),rep(0,2),
       type = 'l',col='black',
       main="Poisson arrivals",ylab="",
       xlab="Time",ylim=c(-0.05,0.05))
} else 
{
  arrivaltimes=rep(0,outcome)
  for(j in seq(from=1,to=outcome,by=1))
  {
    arrivaltimes[j]=sum(arrivalintervals[1:j])
  }

  plot(arrivaltimes[1:outcome],rep(0,outcome),
       type = 'p',col='black',
       main="Poisson arrivals",ylab="",
      xlab="Time",xlim=c(0,threshold),ylim=c(-0.05,0.05))
  lines(seq(0,ceiling(2/poissonmean),by=1),rep(0,ceiling(2/poissonmean)+1),type='l')
}
