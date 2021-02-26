# R T-test 
smu <- c(34, 1200, 23, 50, 60, 50, 0, 0, 30, 89, 0, 300, 400, 20, 10, 0)
sea <- c(20, 10, 5, 0, 30, 50, 0, 100, 110, 0, 40, 10, 3, 0)

# Create the dataframe
both <- c(smu, su)
categoricals <- c(rep(0,length(smu)), rep(1, length(su)))
dat <- data.frame(both, categoricals)
colnames(dat) <- c("money", "school")

# Summary stats
cat(paste0("SMU SD Money: ", sd(dat$money[dat$school == 0]) , "\n",
           "SU SD Money: ", sd(dat$money[dat$school == 1]), "\n",
           "SMU Mean Money: ", mean(dat$money[dat$school == 0]), "\n",
           "SU Mean Money: ", mean(dat$money[dat$school == 1]), "\n"
))

# T Test
t_res <- t.test(smu, sea, conf.level = 0.95, var.equal = FALSE)
t_res
