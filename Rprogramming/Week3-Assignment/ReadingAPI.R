library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "7041069520ab4ebe931f",
                   secret = "46f46a9ea68cce00b9742215d45a7d45f2aa5b12"
)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
