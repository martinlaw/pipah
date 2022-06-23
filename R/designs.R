library(curtailment)
# Current Simon design:
simon <- find2stageDesigns(nmin=34,
                           nmax=34,
                           p0=0.1,
                           p1=0.27,
                           alpha=0.05,
                           power=0.8)
simon$all.des[1,]
simon.plot <- drawDiagram(simon, print.row = 1)

NSCdesigns <- findNSCdesigns(nmin=10,
                             nmax=34,
                             p0=0.1,
                             p1=0.27,
                             alpha=0.05,
                             power=0.8)
drawDiagram(NSCdesigns, print.row=1)
?drawDiagramGeneric

# SC design. SC for futility stopping, NSC for efficacy stopping (minthetaE=1):
SCdesigns.certain <- singlearmDesign(nmin=24,
                                     nmax=36,
                                     stages=3,
                                     p0=0.1,
                                     p1=0.27,
                                     alpha=0.05,
                                     power=0.8,
                                     maxthetaF=1,
                                     minthetaE=1)
# One design produced that is worth considering:
SCdesigns.certain$all.des[3,]
# N=33, ESS0=22, ESS1=28, stages=3
class(SCdesigns.certain)
sc.certain <- drawDiagram(SCdesigns.certain, print.row = 1, xmax = 33, ymax = 34)

# SC design. SC for futility stopping, SC for efficacy stopping:
SCdesigns <- singlearmDesign(nmin=17,
                             nmax=36,
                             stages=2:3,
                             p0=0.1,
                             p1=0.27,
                             alpha=0.05,
                             power=0.8,
                             maxthetaF=0.52,
                             minthetaE=0.9)
SCdesigns$all.des[3,]
# N=33, ESS0=20, ESS1=21, stages=3
sc3 <- drawDiagram(SCdesigns, print.row = 3, xmax = 34, ymax = 34)

ggplot2::ggsave(filename="simon.png", plot=simon.plot$diagram, device="png", path="figs/", width = 6, height = 4, units = "in", dpi=300)
ggplot2::ggsave(filename="SCfutility_NSCefficacy.png", plot=sc.certain$diagram, device="png", path="figs/", width = 6, height = 4, units = "in", dpi=300)
ggplot2::ggsave(filename="SCfutility_efficacy.png", plot=sc3$diagram, device="png", path="figs/", width = 6, height = 4, units = "in", dpi=300)

?curtailment::NSCdesigns
findNSCdesigns


#### RCT designs ####
# devtools::install("../../../R_packages/curtailment")
library(curtailment)
x <- twoarmDesign(nmin.arm=16, nmax.arm=80, block.size=16, pc=0.1, pt=0.27, alpha=0.05, power=0.8, minstop=16, max.combns=1e3)
xx <- twoarmDesign(nmin.arm=40, nmax.arm=60, block.size=20, pc=0.1, pt=0.27, alpha=0.05, power=0.8, minstop=20, max.combns=1e3)
x3 <- twoarmDesign(nmin.arm=48, nmax.arm=60, block.size=24, pc=0.1, pt=0.27, alpha=0.05, power=0.8, minstop=24, max.combns=1e3)


x4 <- singlearmDesign(nmin=24, nmax=36, C=12, p0=0.1, p1=0.27, alpha=0.05, power=0.8, minstop=12)
x4
x5 <- singlearmDesign(nmin=18, nmax=36, C=9, p0=0.1, p1=0.27, alpha=0.05, power=0.8, minstop=9)
x5
x6 <- singlearmDesign(nmin=24, nmax=40, C=8, p0=0.1, p1=0.27, alpha=0.05, power=0.8, minstop=16)
x6
drawDiagram(x6)

############# from June ############

simon <- find2stageDesigns(nmin=6,
                           nmax=16,
                           p0=0.05,
                           p1=0.3,
                           alpha=0.05,
                           power=0.8)

clinfun::ph2simon(pu = 0.05, pa = 0.3, ep1 = 0.05, ep2 = 0.2, nmax = 30)

n14 <- singlearmDesign(nmin=14,
                           nmax=14,
                           C=2,
                           p0=0.05,
                           p1=0.3,
                           alpha=0.05,
                           power=0.8,
                           minstop=8,
                           minthetaE=0.9)
n14
drawDiagram(n14)

n15 <- singlearmDesign(nmin=15,
                       nmax=15,
                       C=3,
                       p0=0.05,
                       p1=0.3,
                       alpha=0.05,
                       power=0.8,
                       minstop=5,
                       minthetaE=0.9)

n15
drawDiagram(n15)

n16 <- singlearmDesign(nmin=16,
                       nmax=16,
                       C=2,
                       p0=0.05,
                       p1=0.3,
                       alpha=0.05,
                       power=0.8,
                       minstop=8,
                       minthetaE=0.9)

n16
drawDiagram(n16)

n.all <- singlearmDesign(nmin=14,
                         nmax=16,
                         C=2:4,
                         p0=0.05,
                         p1=0.3,
                         alpha=0.05,
                         power=0.8,
                         minstop=6,
                         minthetaE=0.9)

n.all
drawDiagram(n.all, 3)

curtailment:::findDesignOCs
# 14: 2: too many stages (7)
# 15: 3
# 16: 2/4
