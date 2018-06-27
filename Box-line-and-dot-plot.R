install.packages("ggplot2")
install.packages("readr")
library(ggplot2)
library(readr)

# Read the data in from a separate file in long format. Six subjects each with 4 timepoints.
# test comment

test = data.frame(read_csv("./test_data.csv"))

# Create a nice theme

theme_update(axis.line.y = element_line(colour="black"),
             axis.line.x = element_line(colour="black"),
             axis.text = element_text(colour="black"),
             panel.grid.major = element_blank(),
             panel.grid.minor = element_blank(),
             panel.background = element_blank(),
             axis.text.x  = element_text(size=16),
             axis.text.y  = element_text(size=16),
             axis.title.x  = element_text(size=18,vjust=1, face="bold"),
             axis.title.y  = element_text(size=18, face = "bold", vjust=1, angle = 90),
             axis.line = element_line(size = 1.2, linetype = "solid"),
             axis.ticks = element_line(size = 1), legend.position="none")


# Dot and box plot with joined lines

ggplot(data=test, aes (x=factor(Time), y= Value)) +
  geom_line(aes(group=ID), alpha=I(0.3), colour = "grey50", lwd=1.5, linetype="dashed") +
  geom_point(size = 4, colour = "lightskyblue2") +
  scale_y_continuous (limits=c(60,150), expand=c(0,0.2)) +
  xlab("Time [mins]") +
  ylab("Units") +
  geom_boxplot(outlier.shape=NA, fill= NA,  colour="black", width=0.2, lwd=1)
