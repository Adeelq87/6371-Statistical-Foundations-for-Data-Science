library(xlsx)

##Archeology Example

archData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session5\\session5Data.xlsx", "archeology")

site_1 <- archData[archData$site == 1,]
site_2 <- archData[archData$site == 2,]
site_3 <- archData[archData$site == 3,]
site_4 <- archData[archData$site == 4,]

hist(site_1$depth,xlab ="Site 1", main = "Site 1")
hist(site_2$depth,xlab ="Site 2", main = "Site 2")
hist(site_3$depth,xlab ="Site 3", main = "Site 3")
hist(site_4$depth,xlab ="Site 3", main = "Site 4")

qqnorm(site_1$depth, main="Q-Q Plot Site 1")
qqnorm(site_2$depth, main="Q-Q Plot Site 2")
qqnorm(site_3$depth, main="Q-Q Plot Site 3")
qqnorm(site_4$depth, main="Q-Q Plot Site 4")

archData$site <- as.character(as.numeric(archData$site))

boxplot(depth~site,data=archData, main="Box plot Arch Data",
        xlab="site", ylab="depth")

attach(archData)
plot(site, depth, main="Scatterplot Arch Data Example",
     xlab="site ", ylab="depth ", pch=19)

arch.anova <- aov(depth ~ site, data=archData)
summary(arch.anova)

## unEqualSD Example

unequalData <- read.xlsx ("C:\\Users\\Martin\\Documents\\SASUniversityEdition\\myfolders\\statFoundations\\session5\\session5Data.xlsx", "unequalSDExample")

group_A <- unequalData[unequalData$group == "A",]
group_B <- unequalData[unequalData$group == "B",]
group_C <- unequalData[unequalData$group == "C",]

hist(group_A$score,xlab ="group A", main = "group A")
hist(group_B$score,xlab ="group B", main = "group B")
hist(group_C$score,xlab ="group C", main = "group C")

qqnorm(group_1$score, main="Q-Q Plot group 1")
qqnorm(group_2$score, main="Q-Q Plot group 2")
qqnorm(group_3$score, main="Q-Q Plot group 3")

unequalData$group <- as.character(as.numeric(unequalData$group))

boxplot(score~group,data=unequalData, main="Box plot UnEqual Data",
        xlab="group", ylab="score")

attach(unequalData)
plot(group, score, main="Scatterplot UnEqual Data Example",
     xlab="group ", ylab="score ", pch=19)

unequal.anova <- aov(score ~ group, data=unequalData)
summary(unequal.anova)

unequal.welch=oneway.test(score ~ group, data=unequalData)
unequal.welch

kruskal=kruskal.test(score ~ group,data=unequalData)
kruskal
