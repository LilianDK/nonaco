<h3 align="center">Shinylive Application</h3>

---

<p align="center"> In this repository I am exploring Shinylive for building my personal homepage deployed on Github Pages. Shinylive is a new application for running Shiny Apps entirely, severless, in a browser. Shinylive joins the programming frameworks for sharing intelligent/data applications such as streamlit, gradio etc. etc. Though one must keep in mind that shinylive is actively in development, therefore there are limitations and frequent updates are to be expected. But it is already so so so sosososososo awwwwwwesome! <3 For my purposes I have rendered my Shiny app into a HTML static file (see the three methods to use Shinylive applications in Ramin's repo linked in the References section below).
    <br> 
</p>

## 📝 Table of Contents
* [App Structure](#chap1)
* [References](#chap2)

## 🎈 App Structure <a name="chap1"></a>
My app structure with some remarks is depicted below. With the app folder and app.R file it is pretty normal for a shiny app. With Shinylive the docs folder 

````
.
└── app                        # shiny app
    └── app.R
        └── www
            ├── home.html
            └── footer.html
        └── data               # Currently I have no data folder and just a single R script with some data. Though for keeping a clean structure I would think about a data folder.
└── docs                       # shinylive app
    ├── edit                    
    └── shinylive
    └── app.json               # R code formatted as JSON
    └── index.html             # HTML to construct web page
└── images                     
````

    
## 🎉 References <a name = "chap2"></a>
* See how to build a Shinylive App and deploying it on Github Pages: ![RamiKrispin/shinylive-r](https://medium.com/@rami.krispin/deploy-shiny-app-on-github-pages-b4cbd433bdc)
* ![Documentation Resources](https://shiny.posit.co/py/docs/shinylive.html)
* ![van Leemput (October 2023), Run a Shiny app in the browser with shinylive for R](https://hypebright.nl/index.php/en/2023/10/02/run-a-shiny-app-in-the-browser-with-shinylive-for-r/) 
