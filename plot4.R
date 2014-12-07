# Copyright 2014 Coursera20141006.  All Rights Reserved.
#
# This file contains a solution to the Coursera Exploratory Data Analysis
# Peer Assessment Assignment 1.

source("tidy.R")  # shared data loading and cleaning code for all
                  # 4 graphs.  Please look at the separate file in the
                  # repository.

tidy <- cacheTidyData()

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(
  tidy$DateTime,
  tidy$Global_active_power,
  xlab="",
  ylab="Global Active Power",
  type="l"
)

plot(
  tidy$DateTime,
  tidy$Voltage,
  xlab="datetime",
  ylab="Voltage",
  type="l"
)


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
       bty="n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(tidy$DateTime,
     tidy$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")

dev.off()


