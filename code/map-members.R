members <- readxl::read_xlsx(here::here("data", "data-members.xlsx"))
members <- as.data.frame(members)[ , 1]

members <- as.data.frame(table(members))
colnames(members) <- c("Country", "n")

members <- members[-which(members$Country == "France"), ]
members <- members[order(members$n, decreasing = FALSE), ]



world <- rnaturalearth::ne_countries(scale = "medium", type = "countries", returnclass = "sf")
world <- sf::st_set_crs(world, 4326)
# world <- world[which(world$Area != "Antarctica"), ]


## Project in Robinson ----

robin <-  "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"
world <- sf::st_transform(world, robin)


# Create Graticules ----

lat <- c( -90,  -60, -30, 0, 30,  60,  90)
lon <- c(-180, -120, -60, 0, 60, 120, 180)

grat <- graticule::graticule(lons = lon, lats = lat, proj = robin, 
                             xlim = range(lon), ylim = range(lat))

## Add Data to Shape file ----

members$Country <- as.character(members$Country)
members[which(members$Country == "UK"), "Country"] <- "United Kingdom"
members[which(members$Country == "USA"), "Country"] <- "United States of America"

world$data <- NA

for (i in 1:nrow(members)) {
  
  lignes <- which(world$admin == members[i, "Country"])
  
  # Detect misspelled country name (to be changed in xlsx not the SHP)
  if (!length(lignes)) stop(paste0(i, " : ", members[i, "Country"]))
  
  world[lignes, "data"] <- members[i, "n"]
}


## Define Colors ----

classes <- data.frame(from  = seq(0, 90, by = 10),   # x >  from
                      to    = seq(10, 100, by = 10), # x <= to
                      label = seq(10, 100, by = 10),
                      color = colorRampPalette(RColorBrewer::brewer.pal("BuPu", n = 9)[-c(1:3)])(10))

world$color <- NA

for (i in 1:nrow(classes)) {
  
  pos <- which(world[ , "data", drop = TRUE] >  classes[i, "from"] & 
                 world[ , "data", drop = TRUE] <= classes[i, "to"])
  
  if (length(pos)) world[pos, "color"] <- classes[i, "color"]
}


# NA values...
pos <- which(is.na(world[ , "data", drop = TRUE]))
if (length(pos)) world[pos, "color"] <- "#f0f0f0"

# Other colors...
borders <- "#c8c8c8"
texte   <- "#666666"



## Graphical Device ----

grDevices::png(file = here::here("assets", "img", "map-members.png"),
               width = 12, height = 7.5, units = "in", res = 300, pointsize = 14)


## Base map + Data + Graticules ----

par(mar = rep(1, 4), family = "serif", bg = "transparent")

sp::plot(grat, lty = 1, lwd = 0.5, col = "white")

plot(sf::st_geometry(world), col = world$"color", border = "white", 
     lwd = 0.5, add = TRUE)


## Legend ----

x_length <- 1000000
x_start  <- -1 * (x_length * (nrow(classes) / 2))

if (nrow(classes) %% 2 == 0) x_start <- x_start - (x_length / 2)

y_height <-    500000
y_middle <- -10000000


par(xpd = TRUE)

for (i in 1:nrow(classes)) {
  
  rect(xleft   = x_start + (i - 1) * x_length, 
       xright  = x_start + i * x_length,
       ybottom = y_middle - y_height, 
       ytop    = y_middle + y_height,
       col     = classes[i, "color"], border = borders)
  
  if (i == 1)
    text(x      = x_start + (i - 1) * x_length, 
         y      = y_middle - y_height, 
         labels = 1,
         pos = 1, cex = 0.9, col = texte)
  # text(x      = x_start + (i - 1) * x_length, 
  #      y      = y_middle - y_height, 
  #      labels = classes[i, "labels"],
  #      pos = 1, cex = 0.9, col = texte)
  if (i == 10)
    text(x      = x_start + (i) * x_length, 
         y      = y_middle - y_height, 
         labels = 100,
         pos = 1, cex = 0.9, col = texte)
}


## Title ----

text(x = 0, y = y_middle + y_height - 100000, col = texte, font = 2, pos = 3,
     labels = "Nombre de chercheurs CESAB (hors France)")

par(xpd = FALSE)

dev.off()
