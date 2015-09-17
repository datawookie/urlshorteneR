# urlshorteneR

A small library for generating short URLs in R.

The [longurl](https://cran.r-project.org/web/packages/longurl/) package will expand URLs from a range of URL shortening services. There is a surprisingly large number of these services (check out the [list](http://api.longurl.org/v2/services)). I tried this package and it does a great job of expanding shortened URLs. It does not provide a shortening service though or access to analytics.

Installation
---

You can install the library directly from the github repository.

    library(devtools)
    install_github("DataWookie/urlshorteneR")

Usage
---

Load the library.

    library(urlshorteneR)

Authenticate for [goo.gl](https://goo.gl/).

    key = "863558629146-3bh2qh1j4c976mf5dtm6n73gi85esn2h.apps.googleusercontent.com"
    secret = "BmLO7fMzZWwexWDp4x0sNh_c"
    shortener_authenticate(key, secret)

Shorten, expand and query analytics.

    shorten.google("http://www.google.com")
    expand.google("http://goo.gl/3WwfIY")
    analytics.google("http://goo.gl/3WwfIY")

Authenticate for [bitly](https://bitly.com/).

    key = "692987373a97579f9faca10e7c2ea15d6c56fd97"
    secret = "752c5fe36d8596fcc73421090260ebe0d7cbc1a9"
    shortener_authenticate(key, secret, "bitly")

Shorten, expand and query analytics.

    shorten.bitly("http://www.google.com")
    expand.bitly("http://bit.ly/1Qho4Y5")
    analytics.bitly("http://bit.ly/1Qho4Y5")

goo.gl
---

Read the [high level overview](https://developers.google.com/url-shortener/v1/getting_started) of Google's URL shortener API, more details can be found in the [API documentation](https://developers.google.com/url-shortener/v1/).

The first thing that you need to do is set up a project in the Google Developers' Console. The [process](https://developers.google.com/console/help/new/) can be broken down as follows:

1. Visit the [Google Developers' Console](https://console.developers.google.com/project) and select "Create Project".
2. Choose an appropriate project name and select "Create".
3. In the Project Dashboard select "Enable Google APIs for use in your apps".
4. Click "URL Shortener API" and then select "Enable API".
5. Click "Credentials" under "APIs & auth".
6. Click "Add credentials" and then select "OAuth 2.0 client ID".
7. Select "Configure consent screen" and fill in the required details.
8. Select "Web application" and press "Create".
9. Fill in the Authorised redirect URIs as directed [below](#Notes-on-Setting-up-Applications).

Further information on OAuth 2.0 authentication at Google can be found [here](https://developers.google.com/identity/protocols/OpenIDConnect) and [here](https://developers.google.com/identity/protocols/OAuth2InstalledApp).

bitly
---

Create an account on [bitly](https://bitly.com/). Login and then [register](http://dev.bitly.com/my_apps.html) a bitly application. Retrieve the Client ID and Client Secret for the application. Check out the information on [bitly authentication](http://dev.bitly.com/authentication.html). The details of [bitly API](http://dev.bitly.com/get_started.html) are worth a read, but not essential because this functionality is implemented by urlshorteneR.

## Notes on Setting up Applications

### Redirect URI

Set this to http://localhost:1410.

## Troubleshooting

### Authentication

If you run into issues with authentication (for example, getting the `(401) Unauthorized` error) then you can try deleting the `.httr-oauth` file.