n <- 9
border <- "#EAEAEA"

color_s <- list()
color_s[[1]] <- RColorBrewer::brewer.pal("Greys", n = n)
color_s[[2]] <- RColorBrewer::brewer.pal("PuBu", n = n)
color_s[[3]] <- RColorBrewer::brewer.pal("YlOrBr", n = n)
color_s[[4]] <- RColorBrewer::brewer.pal("Greens", n = n)

png(filename = here::here("assets", "img", "palette-1.png"), 
    width = 12, height = 6, units = "in", pointsize = 14, res = 300)

par(xaxs = "i", yaxs = "i", family = "serif", mar = c(0.5, 0.5, 0.5, 0.5), bg = "transparent")
plot(0, type = "n", bty = "n", axes = FALSE, ann = FALSE,
     xlim = c(1, n + 1), ylim = c(0.5, length(color_s) + 1))

for (i in 1:length(color_s)) {
  for (j in 1:length(color_s[[i]])) {
    rect(j, i - .45, j + 1, i + .45, col = color_s[[i]][j], border = border)
  }
}

text(5.5, 4.75, "Palettes séquentielles (gradient)", font = 2, cex = 2)

dev.off()



n <- 9
border <- "#EAEAEA"

color_s <- list()
color_s[[1]] <- RColorBrewer::brewer.pal("RdYlGn", n = n)
color_s[[2]] <- RColorBrewer::brewer.pal("RdBu", n = n)
color_s[[3]] <- RColorBrewer::brewer.pal("BrBG", n = n)
color_s[[4]] <- RColorBrewer::brewer.pal("PRGn", n = n)

png(filename = here::here("assets", "img", "palette-2.png"), 
    width = 12, height = 6, units = "in", pointsize = 14, res = 300)

par(xaxs = "i", yaxs = "i", family = "serif", mar = c(0.5, 0.5, 0.5, 0.5), bg = "transparent")
plot(0, type = "n", bty = "n", axes = FALSE, ann = FALSE,
     xlim = c(1, n + 1), ylim = c(0.5, length(color_s) + 1))

for (i in 1:length(color_s)) {
  for (j in 1:length(color_s[[i]])) {
    rect(j, i - .45, j + 1, i + .45, col = color_s[[i]][j], border = border)
  }
}

text(5.5, 4.75, "Palettes divergentes (gradient)", font = 2, cex = 2)

dev.off()


n <- 9
border <- "#EAEAEA"

color_s <- list()
color_s[[1]] <- RColorBrewer::brewer.pal("Set1", n = n)
color_s[[2]] <- RColorBrewer::brewer.pal("Set3", n = n)
color_s[[3]] <- RColorBrewer::brewer.pal("Pastel1", n = n)
color_s[[4]] <- RColorBrewer::brewer.pal("Paired", n = n)

png(filename = here::here("assets", "img", "palette-3.png"), 
    width = 12, height = 6, units = "in", pointsize = 14, res = 300)

par(xaxs = "i", yaxs = "i", family = "serif", mar = c(0.5, 0.5, 0.5, 0.5), bg = "transparent")
plot(0, type = "n", bty = "n", axes = FALSE, ann = FALSE,
     xlim = c(1, n + 1), ylim = c(0.5, length(color_s) + 1))

for (i in 1:length(color_s)) {
  for (j in 1:length(color_s[[i]])) {
    rect(j, i - .45, j + 1, i + .45, col = color_s[[i]][j], border = border)
  }
}

text(5.5, 4.75, "Palettes catégoriques", font = 2, cex = 2)

dev.off()

