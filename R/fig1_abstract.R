librarian::shelf(ggplot2, GGally)

dat <- data.frame(bl=c(5, 13, 14, 15, 16, 15, 9, 7, 6, 18),
                  fu=c(7, 4, 5, 8, 10, 5, 4, 8, 9, 10),
                  dose=c("200 mg", "200 mg", "100 mg", "200 mg", "400 mg",
                         "200 mg", "100 mg", "200 mg", "300 mg", "300 mg"))
dat$dose <- as.factor(dat$dose)

plot(x=1:2, y=dat[1, c("bl", "fu")], ylim=c(0, 25), type = "b", col=which(dat$dose[1]==levels(dat$dose)), lwd=2, pch=20)
for(i in 2:nrow(dat)){
  lines(x=1:2, y=dat[i, c("bl", "fu")], col=which(dat$dose[i]==levels(dat$dose)), lwd=2, type="b", pch=20)
}


GGally::ggparcoord(data = dat, columns = 1:2, boxplot = F, groupColumn = 3, scale = "globalminmax",
                   ylim=c(0, 25))

