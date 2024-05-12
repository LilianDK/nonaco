<h3 align="center">Shinylive Application</h3>

---

<p align="center"> In this repository I am exploring Shinylive for building my personal homepage deployed on Github Pages. 
    <br> 
</p>

## 📝 Table of Contents
* [About](#chap0)
* [App Structure](#chap1)
* [Limitations](#chap3)
* [References](#chap2)

## 🧐 About (the repo) <a name = "chap0"></a>
Shinylive is a new application for running Shiny Apps entirely, severless, in a browser. Shinylive joins the programming frameworks for sharing intelligent/data applications such as streamlit, gradio etc. etc. Though one must keep in mind that shinylive is actively in development, therefore there are limitations and frequent updates are to be expected. But it is already so so so sosososososo awwwwwwesome! <3 For my purposes I have rendered my Shiny app into a HTML static file (see the three methods to use Shinylive applications in Ramin's repo linked in the References section below).

I was thinking a simple web page is kind of boring and having some small "intelligent app" gimmicks included seemed to be straightforward for the content of my web page. The existence of Shinylive just blends perfectly with this desire so you can find a little old school text search support feature on this web page to help the viewer find interesting (inhouse) publications. 

## 🎈 App Structure <a name="chap1"></a>
My app structure with some remarks is depicted below. App folder and app.R file - basically everything normal. With Shinylive a new folder, here called "docs", is new for the shinylive files. 

**Why the "image" folder on root level?:** I noticed that the JSON got insanely large with the rendered shinylive files running into GitHub file size restrictions (GitHub blocks files larger than 100 MiB). Therefore, I uploaded my images for my web page here, linking them in the app.R file.

**Data:** As of now Shinylive is not able to load external data but only data within the app. 

````
.
└── app                        # shiny app
    └── app.R
        └── www
            ├── home.html
            └── footer.html
        └── data               # Currently I have no data folder. For keeping a clean structure I would think about it.
└── docs                       # shinylive app
    ├── edit                    
    ├── shinylive
    ├── app.json               # R code formatted as JSON
    ├── shinylive-sw.js        # Shinylive service worker
    └── index.html             # HTML to construct web page
└── images                     
````

## ⛏️ Limitations <a name = "chap3"></a>
* Slow start-up time (because of loading packages) which could drive the web page visitor nuts
* Deployment on GitHub under the GitHub API rate limits (60 requests per hour)

## 🎉 References <a name = "chap2"></a>
* See how to build a Shinylive App and deploying it on Github Pages: ![RamiKrispin/shinylive-r](https://medium.com/@rami.krispin/deploy-shiny-app-on-github-pages-b4cbd433bdc)
* ![Documentation Resources](https://shiny.posit.co/py/docs/shinylive.html)
* ![van Leemput (October 2023), Run a Shiny app in the browser with shinylive for R](https://hypebright.nl/index.php/en/2023/10/02/run-a-shiny-app-in-the-browser-with-shinylive-for-r/)
* ![Have an eye on this ongoing discussion: https://github.com/posit-dev/r-shinylive/issues/55](https://github.com/posit-dev/r-shinylive/issues/55)

