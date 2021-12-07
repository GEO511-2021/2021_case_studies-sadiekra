library(spotifyr)
library(dplyr)
library(tidyverse)
library(knitr)
library(purrr)
library(ggplot2)

Sys.setenv(SPOTIFY_CLIENT_ID = '097f7729a69e451da9624441ccdb54bd')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'd1b68552cb2843929b58db9b964f87e9')

access_token <- get_spotify_access_token()

TP <- get_artist_audio_features('Tom Petty')
tom_petty <- get_artist_albums(
  id="2UZMlIwnkgAEDBsw1Rejkn",
  include_groups = c("album", "single", "appears_on", "compilation"),
  market = NULL,
  limit = 20,
  offset = 0,
  authorization = get_spotify_access_token(),
  include_meta_info = FALSE
)

TPH <- get_artist_audio_features('Tom Petty and the Heartbreakers')
TPH_Full <-get_artist_albums(
  id="4tX2TplrkIP4v05BNC903e",
  include_groups = c("album", "single", "appears_on", "compilation"),
  market = NULL,
  limit = 20,
  offset = 0,
  authorization = get_spotify_access_token(),
  include_meta_info = FALSE
)
ggplot(TPH_Full, aes(x=release_date, y=name)) +
  geom_point() +
  xlab("Release Date") +
  ylab("Album Name")

