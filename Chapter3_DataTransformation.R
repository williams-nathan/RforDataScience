pacman::p_load(
  nycflights13,
  tidyverse
)
#Exercises 1
#1. In a single pipeline for each condition, find all flights that meet the condtions:
#- Had an arrival delay of two or mor hours
flights |>
  filter(dep_delay>=120)
#- Flew to Houston (IAH or HOU)
flights |>
  filter(dest %in% c('HOU', 'IAH'))

#- Were operated by United, American, or Delta
airlines
flights |>
  filter(carrier %in% c('DL', 'AA', 'UA'))

#-Departed in Summer (July, August, and September)
flights |>
  filter(month %in% c(7, 8, 9))

#-Arrived more than two hours late, but didn't leave late
flights |>
  filter(arr_delay >=120 & dep_delay <= 0)

#-Were delayed by at least an hour, but made up more than 30 minutes in flight
flights |>
  filter(dep_delay >= 60 & arr_delay<=30)

#2. Sort flights to find the flights with the longest departure delays. Find the flights that left earliest in the morning
flights |>
  arrange(desc(dep_delay), dep_time)

flights |>
  arrange(dep_time)

#3. Sort flights to find the fastest flights
flights |>
  arrange(arr_time-dep_time)
