#R assignment
library(sf)
options(repos = c(
  
  spatstat = 'https://spatstat.r-universe.dev',
  
  CRAN = 'https://cloud.r-project.org'))
library(spatstat)
library(rnaturalearth)

#read file
shp <- read_sf("E:/WWU/AOSD/data/Windkraftanlagen.shp")

ger<-ne_countries(country = "germany")

#tranforming
st_transform(shp,32632)
st_transform(ger,32632)
#error
#ploting
plot(st_geometry(shp), col = "red")

tra<-spTransform(ger,CRS(shp))
crs<-read_sf(ger)

##
##
library(sf)
# Linking to GEOS 3.10.2, GDAL 3.4.3, PROJ 8.2.1; sf_use_s2() is TRUE
n <- 30
set.seed(13531) # remove this to create another random sequence
xy <- data.frame(x = runif(n), y = runif(n)) |> 
  st_as_sf(coords = c("x", "y"))

w1 <- st_bbox(c(xmin = 0, ymin = 0, xmax = 1, ymax = 1)) |> 
  st_as_sfc() 
w2 <- st_sfc(st_point(c(1, 0.5))) |> st_buffer(1.2)

par(mfrow = c(1, 2), mar = c(2.1, 2.1, 0.1, 0.5), xaxs = "i", yaxs = "i")
plot(w1, axes = TRUE, col = 'grey')
plot(xy, add = TRUE)
plot(w2, axes = TRUE, col = 'grey')
plot(xy, add = TRUE, cex = .5)

library(spatstat) |> suppressPackageStartupMessages()
as.ppp(xy)

plot(longleaf)

##
##
library(tidyverse)
library(sf)
library(randomForest)
system.file("gpkg/nc.gpkg", package="sf") |>
  read_sf() -> nc
nc.32119 <- st_transform(nc, 'EPSG:32119')
nc.32119 |>
  select(BIR74) |>
  plot(graticule = TRUE, axes = TRUE)


nc |> mutate(SID = SID74/BIR74, NWB = NWBIR74/BIR74) -> nc1
lm(SID ~ NWB, nc1) |>
  predict(nc1, interval = "prediction") -> pr
bind_cols(nc, pr) |> names()

nc2<-set.seed(1000)
nc2 |> mutate(SID = SID74/BIR74, NWB = NWBIR74/BIR74) -> nc2
lm(SID ~ NWB, nc2) |>
  predict(nc2, interval = "prediction") -> pr
bind_cols(nc, pr) |> names()

rd <- st_sample(nc1,1000)

nc1 |> mutate(SID = SID74/BIR74, NWB = NWBIR74/BIR74) -> rd
lm(SID ~ NWB, nc1) |>
  predict(nc1, interval = "prediction") -> pr1

bind_cols(nc1, pr1) |> names()
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree = 500, random_state = 0)