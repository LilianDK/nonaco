# Publications

pub1 <- c("Chancen auf eine sichere digitale Welt mit KI", "DIGITALE WELT", "29.03.2024", "German", "https://digitaleweltmagazin.de/chancen-auf-eine-sichere-digitale-welt-mit-ki/")
pub2 <- c("Übersicht zur neuen U.S. KI Executive Order", "Trend Report", "6.03.2024", "German", "https://trendreport.de/uebersicht-zur-neuen-executive-order/")

docs <- data.frame()
docs <- rbind(docs, pub1, pub2)
names(docs) <- c("title", "outlet", "date", "langauge", "url")

