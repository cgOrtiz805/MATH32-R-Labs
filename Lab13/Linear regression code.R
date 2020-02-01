###########################
#Create some sample data. #
###########################


#########################################
# Store the sample data in a data frame #
#########################################

#MODIFICATIONS START ON LINE 43#########################
Data = read.csv(file = "Lab13data.csv", header = TRUE, sep = "," )
####################
# Plot the points. #
####################

#plot(Data$P,Data$Q)

##########################################
# Try a linear fit function with Y=a+b*X #
##########################################

model1=lm(Q~P, data=Data)

###################################################
# Plot the linear function obtained by regression #
###################################################

xVals=seq(min(Data$P),max(Data$P), by=1)
lines(xVals,xVals*model1$coefficients[2]+model1$coefficients[1])

##############################################################
# Read features of the model including the coeffients.       #
# Notice the very low "Multiple R-Squared" value, indicating #
# a poor fit                                                 #      
##############################################################

summary(model1)

#############################################################
# Since the points look parabolic, consider incorporating   #
# the X's squares - you need to add these to the data frame #
############################################################# CODE STARTS HERE
Data$PSquared=Data$P^10


##################################################################
# Make a new model incorporating the original values and squares #
# Y = a + b*X+c*XSquared                                         #
##################################################################
model2=lm(Q~P+PSquared, data=Data)

############################################
# Plot the points again, add the new model #
############################################

plot(Data$P,Data$Q)
lines(xVals,model2$coefficients[1]+xVals*model2$coefficients[2]+xVals^10*model2$coefficients[3])

################################################################
# Read features of the degree two polynomial linear regression #
# Notice that the value of the R-Squared value is much closer  #
# to 1, indicating a near-perfect match between model and data #
################################################################

summary(model2)




