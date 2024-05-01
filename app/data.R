# Publications

pub1 <- c("Chancen auf eine sichere digitale Welt mit KI", "DIGITALE WELT", "29.03.2024", "German", "https://digitaleweltmagazin.de/chancen-auf-eine-sichere-digitale-welt-mit-ki/", "Die voranschreitende Durchdringung von Anwendungen mit Künstlicher Intelligenz (KI) in Produkten und Dienstleistungen tritt in die nächste Phase des digitalen Zeitalters ein. Damit werden KI-Anwendungen immer mehr zur Grundlage für wirtschaftliche Aktivitäten, sogar unabdingbar für den wirtschaftlichen Erfolg. Diese möchte der Gesetzgeber regulieren, um Risiken vorzubeugen. ")
pub2 <- c("Übersicht zur neuen U.S. KI Executive Order", "Trend Report", "6.03.2024", "German", "https://trendreport.de/uebersicht-zur-neuen-executive-order/", "Für die Verarbeitung von Daten nutzen User und Unternehmen tagtäglich U.S.-Clouddienste. Oder amerikanische Rechendienstleistungen, um eigene Daten oder Daten aus den Datenzentren der Kunden an andere Datenzentren zu senden, dort zu verarbeiten, und anschließend wieder fertig verarbeitet entgegenzunehmen. Neben diesen Datendienstleistungen werden U.S.-Clouddienste genutzt, um Rechenleistungen für KI-Modelle zu beziehen. Am 30. Oktober 2023 erließ das Weiße Haus die „Executive Order on the Safe, Secure, and Trustworthy Development and Use of Artificial Intelligence“.  Dies ist ein einschlägiges Gesetz, welches unter anderem den U.S.-Clouddiensten weitere Transparenzpflichten auferlegt, die auch weltweit Unternehmen und Kunden betreffen. Nachfolgend wird eine Übersicht zu dieser Executive Order gegeben und ein kritischer Punkt hervorgehoben.")

docs <- data.frame()
docs <- rbind(docs, pub1, pub2)
names(docs) <- c("title", "outlet", "date", "language", "url", "abstract")

