#Install Dependencies / Packages used for the Analysis Process (RVEST - used for web scraping, DPLYR - used for data manipulation, JANITOR - used for cleaning data)
#Install tidyverse by using install.packages("tidyverse") and wait for the program to finish installing it.
library(rvest)
library(dplyr)
library(janitor)
library(tidyverse)

#reading the first table from the website
champion_stats <- tables[[1]]
View(champion_stats)
#cleaning the table
champion_stats <- champion_stats[-c(1,2,3),]

colnames(champion_stats) <- NULL
names(champion_stats) <- champion_stats[1,]
champion_stats <- champion_stats[-1,]

# Removing excessive columns with no values
keep.cols <- names(mtcars) %in% c("")
clean.crs <- mtcars [! keep.cols] 

champion_stats <- champion_stats %>% clean_names()
champion_stats <- champion_stats[,colSums(is.na(champion_stats)) < nrow(champion_stats)]

# here we remove columns that are calculated, thus, we will present it using data manipulation
champion_stats <- subset(champion_stats, select = -c(pb_percent, by, wr, kda, cs, cs_m, g_m, kpar, ks, gs))
champion_stats <- subset(champion_stats, select = -c(as))

#parsing all character into integer and double values for calculation process
champion_stats$g <- as.integer(champion_stats$g)
champion_stats$b <- as.integer(champion_stats$b)
champion_stats$g_2 <- as.integer(champion_stats$g_2)
champion_stats$w <- as.integer(champion_stats$w)
champion_stats$l <- as.integer(champion_stats$l)
champion_stats$k <- as.double(champion_stats$k)
champion_stats$d <- as.double(champion_stats$d)
champion_stats$a <- as.double(champion_stats$a)
champion_stats$g_3 <- as.double(champion_stats$g_3)

champion_stats[is.na(champion_stats)] <- 0

#renaming column titles
champion_stats <- champion_stats %>% rename(total_games = g, ban = b, win = w, lose = l, kills = k, deaths = d, assists = a, gold = g_3, games = g_2)

#putting into a csv file for easier reading
write.csv(champion_stats,"C:\\Users\\Admin\\Documents\\ChampionStats.csv", row.names = F)

# Filtering data
champion_stats %>% filter(total_games > 40)

#Computation for the Pick and Ban rate of the Champions
champion_stats <- mutate(champion_stats, pickban_rate = (champion_stats$ban + champion_stats$games)/215 * 100)
champion_stats

# Visualization of Data using Tidyverse's GGPLOT()
champion_stats %>%
  mutate(pickban_rate) %>%
  arrange(desc(pickban_rate)) %>%
  head(20) %>%
  mutate(champion = fct_reorder(champion, pickban_rate)) %>%
  ggplot() + geom_bar (aes(y = champion, x = pickban_rate), stat = "Identity") + 
  labs(x = "Pick and Ban Rate", title = "Highest Pick and Ban Rate Champions in LCK 2021 Spring", caption = "Source: lol.gamepedia.com")

#Computation for the Win Rate of the Champions
champion_stats <- mutate(champion_stats, winrate = (champion_stats$win / champion_stats$games)*100)
champion_stats %>% filter (total_games > 40)

# Visualization of Data using Tidyverse's GGPLOT()
champion_stats %>%
  mutate(winrate) %>%
  arrange(desc(winrate)) %>%
  head(20) %>%
  mutate(champion = fct_reorder(champion, winrate)) %>%
  ggplot() + geom_bar (aes(y = champion, x = winrate), stat = "Identity") + 
  labs(x = "Win Rate", title = "Highest Win Rate Champions in LCK 2021 Spring", caption = "Source: lol.gamepedia.com")
