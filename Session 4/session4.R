library(xlsx)

##R-Code creative Scores t-tests
creativeData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session3\\session3Data.xlsx", "creativity")

t.test(score~group,data=creativeData,var.equal = F, alternative ='two.sided')

##R-Code cognitive data wilcox ranks sum test
cognitiveData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session4\\session4Data.xlsx", "cognitive")

wilcox.test(cognitiveData$Time~cognitiveData$Treatment, exact=FALSE, alternative = "two.sided")

##R-Code salary data t test with unequal variances
salaryData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session4\\session4Data.xlsx", "salary")

t.test(cash~gender,data=salaryData,var.equal = F, alternative ='two.sided')
