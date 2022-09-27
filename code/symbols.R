png(filename = here::here("assets", "img", "symbols.png"), 
    width = 12, height = 6, units = "in", pointsize = 14, res = 300)

x_grad <- seq(-2.5, 6.5)
y_grad <- seq(1.5, 5.5)

par(xaxs = "i", yaxs = "i", family = "serif", mar = c(0.5, 0.5, 0.5, 0.5), bg = "transparent")
plot(0, type = "n", bty = "n", axes = FALSE, ann = FALSE,
     xlim = range(x_grad), ylim = range(y_grad))

points(1, 5, pch = 20)
lines(c(3 - 0.2, 3 + 0.2), c(rep(5, 2)), pch = 19)
rect(5 - 0.2, 5 - 0.1, 5 + 0.2, 5 + 0.1, pch = 19)

points(1 - 0.3, 4, pch = 20, cex = 1)
points(1, 4, pch = 20, cex = 2)
points(1 + 0.3, 4, pch = 20, cex = 3)
lines(c(3 - 0.2, 3 + 0.2), c(rep(4.2, 2)), pch = 19)
lines(c(3 - 0.2, 3 + 0.2), c(rep(4.0, 2)), pch = 19, lwd = 2)
lines(c(3 - 0.2, 3 + 0.2), c(rep(3.8, 2)), pch = 19, lwd = 4)
rect(5 - 0.2, 4 - 0.1, 5 + 0.2, 4 + 0.1, pch = 19)
rect(5 - 0.3, 4 - 0.2, 5 + 0.3, 4 + 0.2, pch = 19, lwd = 2)
rect(5 - 0.4, 4 - 0.4, 5 + 0.4, 4 + 0.4, pch = 19, lwd = 4)

points(1 - 0.3, 3, pch = 20, cex = 2)
points(1, 3, pch = 15, cex = 1.5)
points(1 + 0.3, 3, pch = 18, cex = 2)

lines(c(3 - 0.2, 3 + 0.2), c(rep(3.2, 2)), pch = 19, lwd = 2)
lines(c(3 - 0.2, 3 + 0.2), c(rep(3.0, 2)), pch = 19, lwd = 2, lty = 2)
lines(c(3 - 0.2, 3 + 0.2), c(rep(2.8, 2)), pch = 19, lwd = 2, lty = 4)

rect(5 - 0.2, 3 - 0.1, 5 + 0.2, 3 + 0.1, lwd = 1)
rect(5 - 0.3, 3 - 0.2, 5 + 0.3, 3 + 0.2, lwd = 1, lty = 4)
rect(5 - 0.4, 3 - 0.4, 5 + 0.4, 3 + 0.4, lwd = 1, lty = 3)

points(1 - 0.30, 2, pch = 21, cex = 1.5, col = "black", bg = '#ffffcc')
points(1 - 0.15, 2, pch = 21, cex = 1.5, col = "black", bg = '#a1dab4')
points(1 - 0.00, 2, pch = 21, cex = 1.5, col = "black", bg = '#41b6c4')
points(1 + 0.15, 2, pch = 21, cex = 1.5, col = "black", bg = '#2c7fb8')
points(1 + 0.30, 2, pch = 21, cex = 1.5, col = "black", bg = '#253494')

text(1, 5.25, "Point", xpd = TRUE, pos = 3, font = 2)
text(3, 5.25, "Ligne", xpd = TRUE, pos = 3, font = 2)
text(5, 5.25, "Polygone", xpd = TRUE, pos = 3, font = 2)

text(0, 5, "Type", xpd = TRUE, pos = 2, font = 2)
text(0, 4, "Taille", xpd = TRUE, pos = 2, font = 2)
text(0, 3, "Forme", xpd = TRUE, pos = 2, font = 2)
text(0, 2, "Couleur", xpd = TRUE, pos = 2, font = 2)

lines(c(3 - 0.2, 3 + 0.2), c(rep(2.2, 2)), lwd = 2, col = '#ffffcc')
lines(c(3 - 0.2, 3 + 0.2), c(rep(2.1, 2)), lwd = 2, col = '#a1dab4')
lines(c(3 - 0.2, 3 + 0.2), c(rep(2.0, 2)), lwd = 2, col = '#41b6c4')
lines(c(3 - 0.2, 3 + 0.2), c(rep(1.9, 2)), lwd = 2, col = '#2c7fb8')
lines(c(3 - 0.2, 3 + 0.2), c(rep(1.8, 2)), lwd = 2, col = '#253494')


rect(5 - 0.4, 2 - 0.4, 5 + 0.4, 2 + 0.4, col = '#a1dab4', border = '#ffffcc')
rect(5 - 0.3, 2 - 0.2, 5 + 0.3, 2 + 0.2, col = '#2c7fb8', border = '#253494')
rect(5 - 0.2, 2 - 0.1, 5 + 0.2, 2 + 0.1, col = '#253494', border = '#ffffcc')

dev.off()

