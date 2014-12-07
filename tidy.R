# Copyright 2014 Coursera20141006.  All Rights Reserved.
#
# This file contains a solution to the Coursera Exploratory Data Analysis
# Peer Assessment Assignment 1.
#
# In particular, this file contains common data cleaning for all 4
# plots

dateInteresting <- function(p) {
  # The assignment asks for February 1st and 2nd, 2007.
  # We'll leave the timezone as the local timezone to simplify plot
  # rendering.
  p$year == 107 & p$mon == 1 & (p$mday == 1 | p$mday == 2)
}

getCSV <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  localZip <- "power_consumption.zip"
  internalFile <- "household_power_consumption.txt"
  delim <- ';'
  
  if (!file.exists(localZip)) {
    download.file(url, localZip, method="internal")
  }  
  if (!file.exists(internalFile)) {
    unzip(localZip, overwrite = TRUE)
  }  
  read.csv(internalFile, header=TRUE, sep=";", na.strings=c("?"))
}

parse <- function(raw) {
  dt <- paste(raw$Date, raw$Time)
  raw$DateTime <- as.POSIXlt(dt, format="%d/%m/%Y %H:%M:%S")
  dropColumns <- c("Date", "Time")  
  colFiltered <- raw[, !(names(raw) %in% dropColumns)]
  colFiltered
}

filter <- function(parsed) {
  want <- dateInteresting(parsed$DateTime)
  parsed[want,]
}

cacheTidyData <- function() {
  cacheFile <- "tidy.cached"
  if (file.exists(cacheFile)) {
    load(cacheFile, environment())
    tidy
  } else {
    csv <- getCSV()
    parsed <- parse(csv)
    tidy <- filter(parsed)
    save(tidy, file=cacheFile)
    tidy
  } 
}