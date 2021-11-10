Project Proposal Template
================
Sadie Kratt

# Introduction to problem/question

Tom Petty is one of the greatest rock and roll artists of the 20th
century. He tragically died in 2017 right after he finished up his final
tour. Because he is my favorite artist, I have decided to honor him by
creating a data visualization of his work through R packages. # Problem
/ Question I want to create a comprehensive visualization of Tom Petty’s
career. The main questions that will be answered through this are: How
many studio albums did he release and when? Who are other artists he
worked with? What is the danceability of his songs? How positive are his
songs? What are the most common lyrics used in his songs? What are the
top 10 hits of his career? What places are mentioned by his lyrics?

# Inspiring Examples

## Example 1

![Beatles Data
Visualization](https://www.tableau.com/community/music/beatles)

This was made in tableau and provides a nice example of how to present a
lot of data in an aesthetic manner. I don’t think I will have one
cohesive poster like this one, but it gives ideas of ggplots and how to
represent what data.

## Example 2

![Joy Division Joy
Plot](https://www.rcharlie.com/spotifyr/reference/figures/README-unnamed-chunk-10-1.png)

# Proposed data sources

Spotify API artist data (found in spotifyr)

Tom_Petty (spotify dataset)

US Spatial data (spData)

# Proposed methods

I will be using spotifyr, geniusr, dplyr, spData, sf, and ggplot2.
Spotifyr is a package created to utilize Spotify’s API for retrieving
data. With this package I can use functions such as
“get_album_audio_features” and “get_artist” to find specific information
on Tom Petty. In order to use the spotify API, I have to request an
access token through the developer website. Once this is obtained, I
will set my system environment to that client ID and get the token to
access the database. The geniusr package will be used to analyze the
lyrics in his song. The Dplyr package will be used to organize the data.
Because there are multiple verisons of albums and release dates are in
full date format, not just years, I will have to filter and and group
the data by piping it. I will then use ggplot to plot and customize
graphsof the data being looked at. SpData and sf will be used to make
the maps of location data.

# Expected results

I expect to have charts of albums and songs over the years they were
released, a map of his hometown, a map of places mentioned in lyrics, a
list of the most used lyrics, and an introduction to his life with an
image.
