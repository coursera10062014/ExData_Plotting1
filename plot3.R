# Copyright 2014 Coursera20141006.  All Rights Reserved.
#
# This file contains a solution to the Coursera Exploratory Data Analysis
# Peer Assessment Assignment 1.

source("tidy.R")  # shared data loading and cleaning code for all
                  # 4 graphs.  Please look at the separate file in the
                  # repository.

tidy <- cacheTidyData()

png(filename="plot3.png", width=480, height=480)
plot(
  tidy$DateTime,
  tidy$Sub_metering_1,  # not used
  ylab="Energy sub metering",
  xlab="",
  type="l"
  )
points(tidy$DateTime, tidy$Sub_metering_2, col="red", type="l")
points(tidy$DateTime, tidy$Sub_metering_3, col="blue", type="l")
legend(x="topright",
       col = c("black", "red", "blue"),
       lwd=1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


