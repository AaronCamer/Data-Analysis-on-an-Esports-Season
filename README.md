# LCK Spring 2021 League of Legends Data Analysis

This data analysis is presented in order to give recommendation to the teams participating in the LCK Spring 2021 in terms of Team Compositions, Champions banned or picked, and Team side selection.

## Introduction

Electronic Sports, or simply Esports, have become one of the fastest growing industries in the world. Players from different teams face off in the same games that are
popular, ranging from First-Person Shooting games such as Counter-Strike:GO, Valorant, Overwatch, Call of Duty, to MOBA (Multiplayer Online Battle Arena) games such as
DOTA 2, Mobile Legends, etc., and in the heart of this growing esports scene is the increasing demand in statistics and data for game predictions in-game. One game that
is still prevalent among the field of esports and the demand for in game statistics today is Multiplayer Online Battle Arena game called League of Legends.

## Description of the Dataset

I would like to investigate the League of Legends competitive scene in Korea. I would like to know how top tier teams in the region perform and their team compositions which leads to victory. Through the use of web scraping, I will gather the dataset from the website lol.gamepedia.com, which shows an accurate statistics for the competitive scene. I will use data such as WIN RATE of teams in the blue and red side, the PICK AND BAN rate of champions, and PLAYER statistics which include their personal statistics about the game.

## Definition of Terms

For a better understanding of the study, the following terms are defined:

__Champions__ - refers to the characters used in the game. <br/>
__CS__ - refers to creep score, how many minions were killed by a player, it is related with the gold accumulated by the player. <br/>
__CS/M__ - refers to how many minions were killed by a player per minute. <br/>
__GOLD/M__ - refers to the gold per minute of a player. <br/>
__KDA ratio__ - refers to the ratio of Kills, Deaths, and Assists of a player.<br/>
__Players__ - refers to the person who plays under a certain team. <br/>
__Win rate__ - refers to the percentage of win of each team. <br/>

## Calculation of the Data and Analysis

### Champion Statistics
This is the data analysis of champions during the LCK Spring 2021, with a total of 215 games played with 98 champions contested.

### Pick and Ban Rate
This is where we calculated the Pick and Ban Rate of Champions picked during the tournament.
First, we filter out the data of champions with a total game of 40 or more, for accuracy, since having a very low play rate and high win rate, differs from high play rate.

![image](https://user-images.githubusercontent.com/74399142/186635570-fa385169-463a-4424-aba8-68583d763fd5.png)

Then, we calculate the pick and ban rate using the formula, ((ban + games) / 215 * 100) (215 means the total number of games in LCK).

![image](https://user-images.githubusercontent.com/74399142/186640062-0cec7e84-ad1b-4297-8537-a15072399579.png)

### Win Rate of Champions
Same with Pick and Ban rate, we filtered out the total number of games with 40 and above, but now, we calculate the win rate of champions.
We calculate the win rate of champions by dividing the wins and games of a champion then multiply by 100. In this case, we get:
![image](https://user-images.githubusercontent.com/74399142/186645303-2d9b997d-b9ae-451c-b98d-15da1bea9ef5.png)

### Win Rate of BLUE and RED side
Here we manually added values to the csv file, TeamStats.csv since the scraped material from the website is that, the winning team is only highlighted on the column, therefore, we added R and B values in order to know which side won, and there we calculate the win rate of playing in Blue and Red side.

First import the csv we created new (TeamStats_Rev.csv)

![image](https://user-images.githubusercontent.com/74399142/186650554-66ced776-9130-4c5d-8e09-0ace9bdcc6d0.png)

Since, side_won is in the character class, we have to turn it into a factor.

![image](https://user-images.githubusercontent.com/74399142/186651193-b5786cda-bdbf-4b5d-af27-05c9e9ac0ef3.png)

After that, we need to count the number of side_won and put it onto another table.

![image](https://user-images.githubusercontent.com/74399142/186651391-56fd5c65-89f8-4124-af14-c451414a1400.png)

In this case, we put it in the new_team_stats table.
Now, we calculate the win percentage, which is (n / 215)*100, 215 is the total number of games.

![image](https://user-images.githubusercontent.com/74399142/186651738-7484e4fb-25fc-477b-9da9-006aa3cf4417.png)

Column names are inappropriate so we use the clean_names() function from the janitor library.

![image](https://user-images.githubusercontent.com/74399142/186652231-1480122c-eb8d-49bf-9df9-8eb5f2aea806.png)

## Data Visualization

### Pick and Ban Rate Graph
![HighestPB](https://user-images.githubusercontent.com/74399142/186644582-9d2008a9-32d6-4e42-b1e1-85d0db5c8b97.png)

Across 215 total games in LCK, Gnar has the highest pb with a 89.8% pick and ban rate, meaning that it must be a highly contested champion pick.

### Win Rate Graph
![HighestWR](https://user-images.githubusercontent.com/74399142/186645929-15459073-f5af-454d-8c00-9c6486a87e00.png)

But even though Gnar has a highest PB rate, Maokai has the highest win rate, and Gnar is not included in the top 20. This may imply that players may have
been pick Gnar but continously losing the game. It also shows that in the Pick and Ban Rate Graph, Taliyah is the only one that had a high pick ban rate as well as high win rate. This shows that Taliyah is successful during the season, and teams might want to start picking this champion.

### Side Selection Win Graph

![image](https://user-images.githubusercontent.com/74399142/186719335-d635eaed-26f0-4d27-aa29-c446de8a0e24.png)

In this graph, we can see that blue side has a 15.34884% higher win rate than
on the red side, meaning that teams in LCK find more success in the blue side rather than the red side.

## Conclusion

All of this analysis may help the teams in deciding which side they may choose, champion and team composition they make. It is also shown in the analysis how data manipulation works when working with R, such as calculating the win rate, pick and ban rate of the champions, etc. 
