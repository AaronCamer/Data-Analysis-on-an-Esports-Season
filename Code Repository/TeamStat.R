content <- read_html("https://lol.gamepedia.com/Special:RunQuery/PickBanHistory?PBH%5Bpage%5D=LCK+2021+Spring&PBH%5Btextonly%5D=Yes&pfRunQueryFormName=PickBanHistory")

tables <- content %>% html_table(fill = T)

team_stats <- tables[[1]]

colnames(team_stats) <- NULL
names(team_stats) <- team_stats[1,]
team_stats <- team_stats[-1,]

team_stats <- data.frame(team_stats$Blue, team_stats$Red)

team_stats <- rename(team_stats, c(blue = team_stats.Blue, red = team_stats.Red))

write.csv(team_stats,"C:\\Users\\Admin\\Documents\\TeamStats.csv", row.names = F)