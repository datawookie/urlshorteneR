# urlshorteneR

A small library for generating short URLs in R.

The [longurl](https://cran.r-project.org/web/packages/longurl/) package will expand URLs from a range of URL shortening services. There is a surprisingly large number of these services (check out the [list](http://api.longurl.org/v2/services)). I tried this package and it does a great job of expanding shortened URLs. It does not provide a shortening service though or access to analytics.

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