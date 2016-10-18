# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)
vehicles <- data.frame(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
make <- filter(vehicles, make == "Acura", year == 2015)
best <- filter(make, hwy == max(hwy))
best.model <- select(best, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best <- filter(filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy))

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best <- filter(vehicles, make == "Acura", year == 2015) %>% filter(hwy == max(hwy))

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
NoChain <- function(){
  make <- filter(vehicles, make == "Acura")
  year <- filter(make, year == 2015)
  best <- filter(year, hwy == max(hwy))
}
Nesting <- function(){
  best <- filter(filter(filter(vehicles, make == "Acura"), year == 2015), hwy == max(hwy))
}
Pipe <- function(){
  best <- filter(vehicles, make == "Acura") %>% filter(year == 2015) %>% filter(hwy == max(hwy))
}

for (i in 1:1000){
  NoChain()
}
for (i in 1:1000){
  Nesting()
}
for (i in 1:1000){
  Pipe()
}