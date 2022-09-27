members <- readxl::read_xlsx(here::here("data", "data-members.xlsx"))
members <- as.data.frame(members)[ , 1]

members <- as.data.frame(table(members))
colnames(members) <- c("Country", "n")

members <- members[-which(members$Country == "France"), ]
members <- members[order(members$n, decreasing = FALSE), ]

png(filename = here::here("assets", "img", "barplot-members.png"), 
    width = 8, height = 12, units = "in", pointsize = 16, res = 300)

par(xaxs = "i", yaxs = "i", family = "serif", bg = "transparent", mar = c(2, 4.5, 0.5, 0.5))

plot(0, ylim = c(.5, nrow(members) + .5), xlim = c(0, max(members$n) + 10), axes = FALSE, ann = FALSE, type = "n")

for (i in 1:nrow(members)) {
  rect(0, i - .4, members[i, "n"], i + .5, border = NA, col = "steelblue")
  text(members[i, "n"], i, members[i, "n"], pos = 4, font = 1, cex = .65)
  text(0, i, members[i, "Country"], pos = 2, xpd = TRUE, cex = .65, font = 2)
}

abline(v = seq(10, 100, by = 10), lty = 1, lwd = .25, col = "#EAEAEA")
par(mgp = c(0, 0, 0))
axis(1, at = seq(0, 100, by = 10), cex.axis = 0.75, lwd.ticks = 0, lwd = 0.25)

text(50, 3, "Provenance des chercheurs\nCESAB (hors France)", font = 2, pos = 4)
text(104, -1.15, "Nombre de chercheurs", pos = 2, xpd = TRUE, cex = .85, font = 2)

dev.off()
