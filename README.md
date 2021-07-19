# Url Shortner
It is easy to create and interpret shortened URLs on your own domain from within your Rails application. Once installed application will generate, store URLS and “unshorten” shortened URLs for your applications visitors, all whilst collecting basic usage metrics.

## Specs

- When user submits the URL, the short version should load below without the page reloading.
- The generated short URL path should have 5 random alpha-numeric characters.
- When a user accesses the short URL, they should be redirected properly to the original URL.
- Short URLs will need to expire after one month of creation. Accessing the URLs after a month should return a 404.
- Short URL analytics needs to be tracked. The tracked data could include the following, you can try to track as much as you can.
    1. Number of clicks
    2. IP Addresses
    3. Country

## Installation

Ruby version - ``` 2.6.0 ```
Rails version - ``` 5.2 ```
Clone application and Install the dependencies.

```sh
cd url-shortner
bundle install
rake db:create
rake db:migrate
rails s
```
Open application in browser on 
```sh
localhost:3000 or 127.0.0.1:3000
```
