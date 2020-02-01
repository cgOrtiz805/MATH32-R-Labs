#Goal: Show how easy it is to read in any of the example files!

airTraffic     = read.csv(file="Air_Traffic_Passenger_Statistics.csv", header=TRUE,sep=",")
college        = read.csv(file="College.csv", header=TRUE,sep=",")
credit         = read.csv(file="Credit.csv", header=TRUE,sep=",")
US             = read.csv(file="US_County_Level_Presidential_Results_2008-2012-2016.csv", header=TRUE,sep=",")
west           = read.csv(file="wnv_human_cases.csv", header=TRUE,sep=",")

##################################################
# Correctly format Numeric Data in our Data Sets #
##################################################

#Fix Air Traffic Data Set
airTraffic$Passenger.Count = as.numeric(airTraffic$Passenger.Count)

#Fix US Voting Data Set
for (i in c(3:15)){
  US[,i] = as.numeric(US[,i])
}

###############################################
# Selects only Certain States from the States #
###############################################

CAIndex = which(US$state_abbr=="CA")
RIIndex = which(US$state_abbr=="RI")
CARIResults = US[c(CAIndex,RIIndex),]

######################################################################
# Selects Only Individuals with More than a particiular Credit Limit #
######################################################################

enoughCredit = credit[which(credit$Limit > 2000),]
