library(rvest)
library(dplyr)
library(janitor)


content <- read_html("https://lol.gamepedia.com/Special:RunQuery/TournamentStatistics?TS%5Btournament%5D=LCK%2F2021+Season%2FSpring+Season&TS%5Bpreload%5D=TournamentByPlayer&pfRunQueryFormName=TournamentStatistics")

tables <- content %>% html_table(fill = T)

player_stats <- tables[[1]]

player_stats <- player_stats[-c(1,2,3),]
colnames(player_stats) <- NULL
names(player_stats) <- player_stats[1,]
player_stats <- player_stats[-1,]
player_stats <- player_stats %>% clean_names()
player_stats <- player_stats[,colSums(is.na(player_stats)) < nrow(player_stats)]
player_stats <- subset(player_stats, select = -c(x, champs, kpar, ks, gs, cp, kda, wr))
player_stats <- rename(player_stats, c(player = x_2, total_games = g, win = w, lose = l, kills = k, deaths = d, assist = a, gold = g_2, gold_min = g_m))

player_stats$total_games <- as.integer(player_stats$total_games)
player_stats$win <- as.integer(player_stats$win)
player_stats$lose <- as.integer(player_stats$lose)
player_stats$kills <- as.double(player_stats$kills)
player_stats$deaths <- as.double(player_stats$deaths)
player_stats$assist <- as.double(player_stats$assist)
player_stats$gold <- as.double(player_stats$gold)
player_stats$gold_min <- as.integer(player_stats$gold_min)

write.csv(player_stats,"C:\\Users\\Admin\\Documents\\PlayerStats.csv", row.names = F)
