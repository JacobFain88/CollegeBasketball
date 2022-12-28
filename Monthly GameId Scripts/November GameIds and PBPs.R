rm(list=ls())
library(tidyverse)
library(kableExtra)
library(randomForest)
library(xgboost)
library(ggplot2)
if (!requireNamespace('tictoc', quietly = TRUE)){
  install.packages('tictoc')
}
library(hoopR)
library(bigballR)
devtools::install_github("jflancer/bigballR")
library(bigballR)

schedule <- get_team_schedule(season = "2022-23", team.name = "Illinois")
# Get play by play for all games played so far in season
play_by_play <- get_play_by_play(schedule$Game_ID[1])


get_date_games(paste0("11/7/2022"))

gameids <- data.frame()
for(i in 7:30){
  tryCatch(x <- get_date_games(paste0("11/",i,"/2022")))
  gameids <- bind_rows(gameids,x)
}


gameids2 <- gameids %>% 
  filter(!is.na(GameID))

write.csv(gameids2,file="GameIDs/November22GameIds.csv")

pbp_Nov <- get_play_by_play(gameids2$GameID)


write.csv(gameids2,file="PBP Data/2211_PBPData.csv")
