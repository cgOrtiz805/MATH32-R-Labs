#Ball and Urn Problem

#Goal: To illustrate how to use R to sample with and without
#        replacement and show your theoretical and experimental 
#        results on a plot.

####################
# Create Variables #
####################

numTrials  = 10000;
totalBlack = 4;
totalRed   = 4;
totalBalls = totalBlack+totalRed;
ballsToDraw = 4;

#Urn is an "vector" with the words "red" and "black" the correct number of times
urn        = c(replicate(totalRed,"red"),replicate(totalBlack,"black"))

# makes a vector to count the number times we observe a specific outcome. 
# We either draw 0, 1, 2, ..., totalBlack 
numBlackDrawnTally = 0*c(0:totalBlack)

########################
# Carry out Experiment #
########################
for (j in seq(from=1,to=numTrials,by=1))
{
    #Draw the balls 
    drawnballs = sample(urn,ballsToDraw,replace=FALSE)
    
    #Number of Black Balls Drawn
    blackDrawn  = sum(drawnballs=="black"); 
    
    #Add to Count Index: (Since arrays start at index 1, we need to shift)
    numBlackDrawnTally[blackDrawn + 1] = numBlackDrawnTally[blackDrawn + 1]+1
}


#####################
# TrueProbabilities #
#####################

#You will need to code this by hand. 
#You can either change my code below to match the new requirements OR calculate these probabilities by hand and set the numerical values here.
#Note: There are better ways to code this than what I have done!
trueProb    = 0*c(0:totalBlack);

#Prob we have 0 black drawn
trueProb[1] = (totalRed/totalBalls)*(totalRed-1)/(totalBalls-1)*(totalRed-2)/(totalBalls-2);

#Prob we have 1 black drawn
trueProb[2] = choose(ballsToDraw,1)*totalBlack/(totalBalls*(totalBalls-1))

#Prob we have 2 black drawn
trueProb[3] = choose(ballsToDraw,2)*(totalBlack)*(totalBlack-1)*(totalBlack-2)/(totalBalls*(totalBalls-1)*(totalBalls-2))

#Prob we have 3 black drawn
trueProb[4] =choose(ballsToDraw,3)*(totalBlack)*(totalBlack-1)*(totalBlack-2)*(totalBlack-3)/(totalBalls*(totalBalls-1)*(totalBalls-2)*(totalBalls-3))

#prob we have 4 black drawn

trueProb[5] = choose(ballsToDraw,4)*(totalBlack)*(totalBlack-1)*(totalBlack-2)*(totalBlack-3)/(totalBalls*(totalBalls-1)*(totalBalls-2)*(totalBalls-3)*(totalBalls-4))
############################################################
# Plot and Compare the Experimental and True Probabilities #
############################################################

#Experimental Probabilities
plot(c(0:totalBlack),numBlackDrawnTally/numTrials,col='red', xlab="Number of Black Balls Drawn", ylab="Probability",type='b')

#True Probabilities
points(c(0:totalBlack),trueProb,col='black',type='b')

