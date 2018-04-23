library(ggplot2)
library(readr)

# This is the RBF and BAT data for the 6 GTN subjects MEAN PERFUSION (CORTEX) AVERAGED L-R and MEAN BAT (CORTEX) - AVERAGED L-R
# from GTN - CORTEX AND MEDULLA - BY IMAGE EROSION - CONTROL-IMAGE T1 MAPS - ALL STUDIES

# Read the data in from a separate file in long format

test = read_csv("./test_data.csv")
test = data.frame(test)

# Create a nice theme

theme_update(axis.line.y = element_line(colour="black"),
             axis.line.x = element_line(colour="black"),
             axis.text = element_text(colour="black"),
             panel.grid.major = element_blank(),
             panel.grid.minor = element_blank(),
             panel.background = element_blank(),
             axis.text.x  = element_text(size=20),
             axis.text.y  = element_text(size=20),
             axis.title.x  = element_text(size=22,vjust=1, face="bold"),
             axis.title.y  = element_text(size=22, face = "bold", vjust=1, angle = 90),
             axis.line = element_line(size = 1.2, linetype = "solid"),
             axis.ticks = element_line(size = 1), legend.position="none")


# Dot and box plot with joined lines

ggplot(data=test, aes (x=factor(Time), y= Value)) +
  geom_line(aes(group=ID, colour="black"), alpha=I(0.5), lwd=1.5, linetype="dashed") +
  geom_point(size = 4, colour = "lightskyblue1") +
  scale_y_continuous (limits=c(60,150), expand=c(0,0.2)) +
  xlab("\nTime [mins]") +
  ylab("Units\n") +
  geom_boxplot(outlier.shape=NA, fill= NA,  colour="black", width=0.2, lwd=1)
