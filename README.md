# LCK Spring 2021 Data Analysis

This data analysis is presented in order to give recommendation to the teams participating in the LCK Spring 2021 in terms of Team Compositions, Player champions ban,
Team side selection.

## Introduction

Electronic Sports, or simply Esports, have become one of the fastest growing industries in the world. Players from different teams face off in the same games that are
popular, ranging from First-Person Shooting games such as Counter-Strike:GO, Valorant, Overwatch, Call of Duty, to MOBA (Multiplayer Online Battle Arena) games such as
DOTA 2, Mobile Legends, etc., and in the heart of this growing esports scene is the increasing demand in statistics and data for game predictions in-game. One game that
is still prevalent among the field of esports and the demand for in game statistics today is Multiplayer Online Battle Arena game called League of Legends.

## Description of the Dataset

I would like to investigate the League of Legends competitive scene in Korea. I would like to know how top tier teams in the region perform and their team compositions which leads to victory. Through the use of web scraping, I will gather the dataset from the website lol.gamepedia.com, which shows an accurate statistics for the competitive scene. I will use data such as WIN RATE of teams in the blue and red side, the PICK AND BAN rate of champions, and PLAYER statistics which include their personal statistics about the game.

## Definition of Terms

For a better understanding of the study, the following terms are defined:

Champions - refers to the characters used in the game.
CS - refers to creep score, how many minions were killed by a player, it is related with the gold accumulated by the player.
CS/M - refers to how many minions were killed by a player per minute.
GOLD/M - refers to the gold per minute of a player.
KDA ratio - refers to the ratio of Kills, Deaths, and Assists of a player.
Players - refers to the person who plays under a certain team.
Win rate - refers to the percentage of win of each team.

## Calculation of the Data and Analysis

### Champion Statistics
This is the data analysis of champions during the LCK Spring 2021, with a total of 215 games played with 98 champions contested.

### Pick and Ban Rate
his is where we calculated the Pick and Ban Rate of Champions picked during the tournament.
First, we filter out the data of champions with a total game of 40 or more, for accuracy, since having a very low play rate and high win rate, differs from high play rate.

![image](https://user-images.githubusercontent.com/74399142/186635570-fa385169-463a-4424-aba8-68583d763fd5.png)
