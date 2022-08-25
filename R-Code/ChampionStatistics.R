#Install Dependencies / Packages used for the Analysis Process (RVEST - used for web scraping, DPLYR - used for data manipulation, JANITOR - used for cleaning data)
library(rvest)
library(dplyr)
library(janitor)

#reading content from the website
content <- read_html("https://lol.gamepedia.com/Special:RunQuery/TournamentStatistics?TS%5Btournament%5D=LCK%2F2021+Season%2FSpring+Season&TS%5Bpreload%5D=TournamentByChampion&pfRunQueryFormName=TournamentStatistics")

tables <- content %>% html_table(fill = TRUE)

#reading the first table from the website
champion_stats <- tables[[1]]
View(champion_stats)
#cleaning the table
champion_stats <- champion_stats[-c(1,2,3),]

colnames(champion_stats) <- NULL
names(champion_stats) <- champion_stats[1,]
champion_stats <- champion_stats[-1,]

keep.cols <- names(mtcars) %in% c("")
clean.crs <- mtcars [! keep.cols] 

champion_stats <- champion_stats %>% clean_names()
champion_stats <- champion_stats[,colSums(is.na(champion_stats)) < nrow(champion_stats)]

champion_stats <- subset(champion_stats, select = -c(pb_percent, by, wr, kda, cs, cs_m, g_2, g_m, kpar, ks, gs))
champion_stats <- subset(champion_stats, select = -c(as))

champion_stats[is.na(champion_stats)] <- 0

#parsing all character into integer and double values
champion_stats$g <- as.integer(champion_stats$g)
champion_stats$b <- as.integer(champion_stats$b)
champion_stats$g_1 <- as.integer(champion_stats$g_1)
champion_stats$w <- as.integer(champion_stats$w)
champion_stats$l <- as.integer(champion_stats$l)
champion_stats$k <- as.double(champion_stats$k)
champion_stats$d <- as.double(champion_stats$d)
champion_stats$a <- as.double(champion_stats$a)

# Renaming column titles
champion_stats <- rename(champion_stats, c(total_games = g, ban = b, games = g_1, win = w, lose = l, kills = k, deaths = d, assists = a))

# Puting into a csv file for easier reading
write.csv(champion_stats,"C:\\Users\\Admin\\Documents\\ChampionStats.csv", row.names = F)

