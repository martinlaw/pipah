library(ggplot2)
library(tibble)
dat <- tibble(Patient=1:17,
                  `Dose Level (mg)`= c(100, 200, 300, 300, 400, 400, 300, 300, 400, 300, 300, 300, 300, 200, 100, 200, 200),
                  Cohort=c(rep("CRM", 13), rep("Extension", 4)),
                  Toxicity=c("No", "No", "No", "No", "No", "Yes", "No", "No", "Yes", "No", "No", "Yes", "Yes", "No", "No", "No", "No"))

ggplot(data=dat, mapping=aes(x=Patient, y=`Dose Level (mg)`, col=Toxicity, shape=Toxicity))+
 # annotate("rect", xmin=13.5, xmax=Inf, ymin=-Inf, ymax=Inf, alpha=0.15)+
  geom_rect(aes(xmin=13.5, xmax=Inf, ymin=-Inf, ymax=Inf, fill=Cohort), alpha=0.8, inherit.aes=F)+
  geom_point(size=3)+
  scale_color_manual(values = c("No" = "black", "Yes" = "red"))+
  scale_fill_manual(values = c("white", "grey"), guide=guide_legend(override.aes=list(col="black")))+
  scale_x_continuous(name="Patient", breaks=1:17, labels=dat$Patient)+
  theme_minimal()+
  theme(panel.grid.minor = element_blank(), panel.grid.major=element_blank())

#ggsave(filename="fig1.png", device="png", dpi=300, bg="white")
