install.packages('sqldf')
install.packages('lubridate')
install.packages("readxl")

# load the libraries
library(sqldf)
library(lubridate)
library("readxl")


schools <- read_excel(file.choose())
tower <- read_excel(file.choose())
hospitals <- read_excel(file.choose())

hosdata <- sqldf("SELECT  distinct a.number
               FROM hospitals as a, tower as o
               where SQRT(SQUARE(a.Latitude - o.Latitude) 
               + SQUARE(a.Longitude - a.Longitude)) <= .00137363 ")


Count <- sqldf("SELECT  distinct a.number
               FROM schools as a, tower as o
               where SQRT(SQUARE(a.Latitude - o.Latitude) 
               + SQUARE(a.Longitude - a.Longitude)) <= .00137363 ")
