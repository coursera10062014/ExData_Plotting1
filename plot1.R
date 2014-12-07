# Copyright 2014 Coursera20141006.  All Rights Reserved.
#
# This file contains a solution to the Coursera Exploratory Data Analysis
# Peer Assessment Assignment 1.

source("tidy.R")  # shared data loading and cleaning code for all
                  # 4 graphs.  Please look at the separate file in the
                  # repository.

tidy <- cacheTidyData()

png(filename="plot1.png", width=480, height=480)
hist(
  tidy$Global_active_power,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)"
  )
dev.off()


