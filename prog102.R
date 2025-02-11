library(marinecs100b)


# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-03 23:59", tz = "Etc/GMT+8")
hotday_idx <- which(kefj_site == hottest_site &
                      kefj_datetime >= hotday_start &
                      kefj_datetime <= hotday_end)
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)



# P2: Fill in the blanks below to write the Alaskan datetime utility function.
alaskan_datetime <- function(date) {
  result <- as.POSIXct(date, tz = "Etc/GMT+8")
  return(result)
}


# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01

day_start <- as.POSIXct("2012-06-01 00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2012-06-01 23:59", tz = "Etc/GMT+8")
day_idx <- which(kefj_site == "Aialik" &
                      kefj_datetime >= day_start &
                      kefj_datetime <= day_end)
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)


# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.

day_start <- as.POSIXct("2012-04-05 00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2012-04-05 23:59", tz = "Etc/GMT+8")
day_idx <- which(kefj_site == "Harris" &
                   kefj_datetime >= day_start &
                   kefj_datetime <= day_end)
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)



# P5: Compare your solutions for P3 and P4 - what variables changed?

# we changed the starttime, endtime and plot


#we changed the date of the plot and the name of the site in the parenthesis " "
#P3- a transition in the morining triggered a low to air and another transition



#causes a plateau and then the next transition in the evening causes a peak

# in the early morning and peaks in the evening. P4 has two lows in the early
# morning and at night. There is a peak in the middle of the day. P3 low is
# driven by transition temp, high peak is driven by air/transition temp. For P4,
# both lows are driven by air/transition temp and the peak is driven by water
# temp.


# P6: What you would pick for the temperature extraction function and
# parameters' names?

# we would chnage it from "aialik" to "Harris"
#nwe changed the date to 2012-04-05



# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temp<- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
                     kefj_datetime >= start_alaska &
                     kefj_datetime <= end_alaska
  day_temperature <- kefj_temperature[extract_idx]
  return(result)
}
extract_temp ("Harris","2016-04-05 00:00", "2016-04-05 23:59")


# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.


extract_datetime<- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= start_alaska &
    kefj_datetime <= end_alaska
  day_temperature <- kefj_datetime[extract_idx]
  return(result)
}
extract_datetime("Harris","2016-04-05 00:00", "2016-04-05 23:59")


extract_exposure<- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= start_alaska &
    kefj_datetime <= end_alaska
  day_temperature <- kefj_exposure[extract_idx]
  return(result)
}
extract_exposure("Harris","2016-04-05 00:00", "2016-04-05 23:59")



# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)

# P10: Visualize Nuka Pass on July 1, 2018.
plot_kefj(extract_datetime("Nuka Pass","2018-07-01 00:00","2018-07-01 23:59"),
          extract_temp("Nuka Pass","2018-07-01 00:00","2018-07-01 23:59"),
          extract_exposure("Nuka Pass","2018-07-01 00:00","2018-07-01 23:59")

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
