library(janitor)
library(tidyverse)

team_stats <- read.csv(file.choose(), header = T)
head(team_stats)

team_stats$side_won <- as.factor(team_stats$side_won)
summary(team_stats)

new_team_stats <- team_stats %>% count(team_stats$side_won)
View(new_team_stats)
new_team_stats

new_team_stats <- mutate(new_team_stats, winrate=(new_team_stats$n / 215)*100)
new_team_stats

#cleaning the name
new_team_stats <- new_team_stats %>% clean_names()
new_team_stats <- rename(new_team_stats, c(side_won = team_stats_side_won))
new_team_stats

#Visualization of the Data
new_team_stats %>%
  mutate(winrate) %>%
  arrange(desc(winrate)) %>%
  head(20)%>%
  mutate(side_won = fct_reorder(side_won, winrate)) %>%
  ggplot() + geom_bar(aes(y = side_won, x = winrate, fill=side_won), stat="identity", color="black") +
  labs(x= "Win Rate", y = "Side", title = "Blue and Red Side Win Rate in LCK", caption="source: lol.gamepedia.com")

