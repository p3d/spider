# README

This application fetches audience geography data from alexa.com and then spiders the domain name, counting the number of internal and external links.

## How to use this application
Download the source code.
run `bundle install`
run `rails c` to load the rails console.
run `PublisherCrawler.new().perform([domain])` to crawl the domain

in a different terminal window run rails s to start the application in development mode.
You can see a basic list of the Website and DomainCountry records at http://localhost:3000


