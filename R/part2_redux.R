librarian::shelf(martinlaw/curtailment, ggplot2, clinfun)


############# from June (submitted previously) ############

simon <- find2stageDesigns(nmin=6,
                           nmax=16,
                           p0=0.05,
                           p1=0.3,
                           alpha=0.05,
                           power=0.8)

############### Aug 2024 ###########

increase.p0 <- find2stageDesigns(nmin=6,
                                 nmax=20,
                                 p0=0.08,
                                 p1=0.3,
                                 alpha=0.05,
                                 power=0.8)

increase.p0.2 <- find2stageDesigns(nmin=6,
                                   nmax=25,
                                   p0=0.09,
                                   p1=0.3,
                                   alpha=0.05,
                                   power=0.8)

drawDiagram(increase.p0)

# Increase p1 and possibly p0: number of responders was 8 out of 12 in part 1:
increase.p1.p0 <- find2stageDesigns(nmin=6,
                                   nmax=25,
                                   p0=0.2,
                                   p1=0.66,  # 8 out of 12 rounded down
                                   alpha=0.05,
                                   power=0.8)
increase.p1.p0 # Tiny: N=8, even when increasing p0 to 0.2. Try reducing p1, justifying as "conservative":

increase.p1.p0 <- find2stageDesigns(nmin=6,
                                    nmax=25,
                                    p0=0.2,
                                    p1=0.5,  # conservative
                                    alpha=0.05,
                                    power=0.8)
increase.p1.p0 # N=17 of 18. Fine. Recruit 20 and assume drop out of 3.
diag <- drawDiagram(increase.p1.p0, print.row = 2)
ggsave(filename = "sample_size_p1-50.png", plot=diag$diagram, device = "png",
       path = "figs/", width=6, height=3.5)

library(clinfun)
clinfun::ph2simon(0.2, pa = 0.5, ep1 = 0.05, ep2 = 1-0.8, nmax = 30)
