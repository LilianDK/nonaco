# Publications

pub1 <- c("Chancen auf eine sichere digitale Welt mit KI", "DIGITALE WELT", "29.03.2024", "German", "https://digitaleweltmagazin.de/chancen-auf-eine-sichere-digitale-welt-mit-ki/", "Die voranschreitende Durchdringung von Anwendungen mit Künstlicher Intelligenz (KI) in Produkten und Dienstleistungen tritt in die nächste Phase des digitalen Zeitalters ein. Damit werden KI-Anwendungen immer mehr zur Grundlage für wirtschaftliche Aktivitäten, sogar unabdingbar für den wirtschaftlichen Erfolg. Diese möchte der Gesetzgeber regulieren, um Risiken vorzubeugen. ")
pub2 <- c("Übersicht zur neuen U.S. KI Executive Order", "Trend Report", "6.03.2024", "German", "https://trendreport.de/uebersicht-zur-neuen-executive-order/", "Für die Verarbeitung von Daten nutzen User und Unternehmen tagtäglich U.S.-Clouddienste. Oder amerikanische Rechendienstleistungen, um eigene Daten oder Daten aus den Datenzentren der Kunden an andere Datenzentren zu senden, dort zu verarbeiten, und anschließend wieder fertig verarbeitet entgegenzunehmen. Neben diesen Datendienstleistungen werden U.S.-Clouddienste genutzt, um Rechenleistungen für KI-Modelle zu beziehen. Am 30. Oktober 2023 erließ das Weiße Haus die „Executive Order on the Safe, Secure, and Trustworthy Development and Use of Artificial Intelligence“.  Dies ist ein einschlägiges Gesetz, welches unter anderem den U.S.-Clouddiensten weitere Transparenzpflichten auferlegt, die auch weltweit Unternehmen und Kunden betreffen. Nachfolgend wird eine Übersicht zu dieser Executive Order gegeben und ein kritischer Punkt hervorgehoben.")
pub3 <- c("Levels of Automation with AI", "Medium", "16.04.2024", "English", "https://medium.com/@lilian.do.khac/levels-of-automation-a250b5b1b697", "Take Aways\n

    With augmentation we emphasize the real potential of the digital age.
    Orientation along levels of automation make requirements for AI applications more crispy.
    With a clear understanding of the levels of automation and associated risks, higher automation levels are achievable.")

pub4 <- c("Number crunching: How many GPUs for hosting LLMs?", "Medium", "19.03.2024", "English", "https://medium.com/@lilian.do.khac/number-crunching-how-many-gpus-for-hosting-llms-5c36dc723ed6", "Investment decisions to host LLMs on-premises are build on knowledge regarding realizing LLM services, LLMs themselves and hardware capabilities.
Take Aways

1. On-Prem Hosting Motivation: GDPR, IP, and reduced cloud dependencies drive on-prem LLM hosting.

2. Hardware Sizing Complexity: On-prem LLM hardware requirements are multidimensional.

3. Practical GPU Examples: Meta’s Llama-2–7B and 70B models GPU needs.")
pub5 <- c("Three facts on ChatGPT — which grape to reap?", "Medium", "17.03.2024", "English", "https://medium.com/@lilian.do.khac/three-facts-on-chatgpt-which-grape-to-reap-6c17a97c4ce8", "Fact one: ChatGPT essentially went viral by setting a rates that surpass adoption rates of popular platforms like TikTok or Instagram. Essentially it is becoming the Nutella, Tempo, Uhu, or Pampers and Co in common phrasing as a synonym for a seemingly very useful and smart AI. record on its user adoption

Fact two: There are some more such “AI things” that can be smart and seemingly useful.

Fact three: But there are not that many more.")

pub6 <- c("Artificial General Intelligence Unravelled: A Cockpit to Navigate IT-Capabilities, Regulatory Constraints, Business Processes and User Experience.", "Marburg University", "22.09.2023", "English", "https://www.uni-marburg.de/de/fb02/professuren/bwl/digiprozess/forschung/202309_whitepaper_artificial-general-intelligence-unravelled-_v1-0_en.pdf", "AI and foundation models develop with an unprecedented speed and challenge organisations
around the globe: we witness changing customer expectations, expectations of employees and
new requirements to IT-capabilities. At the same time digital regulation, particularly for AI, is evolving and expected to be present in the
second half this current decade. Therefore, the development of these regulations must be
monitored closely and applied in far-sight to avoid issues with compliance. The provision of such powerful AI models in business applications demands for a high-performance
computing infrastructure and this means a significant investment decision. Decision-makers must
derive from their desired business vision what they can integrate feasibly and how much risk they
can afford to take. The integration of modern AI capabilities will fundamentally change job designs and is expected to
lead to increases in productivity. The skills of human and machine collaboration as well as enabling
factors for such are becoming a key competitive advantage.")

pub7 <- c("Digitale Transformation: Wie es bei Organisationen schneller vorangehen kann, White Paper Serie des Lehrstuhls ABWL", "Marburg University", "April 2022", "German", "https://www.uni-marburg.de/de/fb02/professuren/bwl/digiprozess/whitepaperserie/white_paper_bwl_dl_leyer_vol4_nr1_de.pdf", "Die Weiterentwicklung von Unternehmen im
digitalen Zeitalter verzögert sich oft und führt
dazu, dass einige Unternehmen Stück für Stück
den Anschluss verlieren. Dabei verlieren sie an
zwei Stellen den Anschluss. Die eine Stelle ist
die zum Kunden, denn wegen schleppender
Modernisierung ihrer Geschäftsmodelle wird
die zunehmende Erfüllung der stark individu-
ellen Marktnachfrage nicht bedient. Die andere
Stelle ist nach innen gerichtet, nämlich die Un-
ternehmenskultur. Konkreter: Der Umgang mit
den Mitarbeitern im digitalen Zeitalter. Unter-
nehmen verlieren zunehmendst den Anschluss
und ein Feingefühl für die Bedürfnisse ihrer
doch recht wichtigen „Digital Natives“ Mitarbei-
ter. Die Gründe sind vielfältig und auch nicht
neu, auch wenn einige verhaltensorientiert ge-
prägte Gründe inzwischen häufiger oder extre-
mer auftreten. Dieses Whitepaper ist daher ein
Reminder, wie einige dieser wichtigen Aspekte
adressiert werden können. Es erhebt allerdings
keinen Anspruch auf Vollständigkeit.")

docs <- data.frame()
docs <- rbind(docs, pub1, pub2, pub3, pub4, pub5, pub6, pub7)
names(docs) <- c("title", "outlet", "date", "language", "url", "abstract")
