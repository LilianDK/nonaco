<h3 align="center">Shinylive Application</h3>

---

<p align="center"> In this repository I am exploring Shinylive for building my personal homepage deployed on Github Pages. Shinylive is a new application for running Shiny Apps entirely, severless, in a browser. Shinylive joins the programming frameworks for sharing intelligent/data applications such as streamlit, gradio etc. etc. 
    <br> 
</p>

## 📝 Table of Contents
* [App Structure](#chap1)
* [References](#chap2)

## 🎈 App Structure <a name="chap1"></a>
The front-end allows you to use the plain playground just like in the respective account to configure and try out prompt engineering. Further, there is also a functionality that allows you uploading a PDF file for which the selected page will be summarized. Finally, there is also a basic chat functionality to chat with the world knowledge of the llm.

````
.
└── app
    └── app.R
        └── www
            └── home.html
            └── footer.html
        └── data
└── docs
    ├── edit
    └── shinylive
└── images
````

    
## 🎉 References <a name = "chap2"></a>
* See how to build a Shinylive App and deploying it on Github Pages: ![RamiKrispin/shinylive-r](https://medium.com/@rami.krispin/deploy-shiny-app-on-github-pages-b4cbd433bdc)
* ![Documentation Resources](https://shiny.posit.co/py/docs/shinylive.html)
