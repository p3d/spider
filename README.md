# README

This application fetches audience geography data from alexa.com and then spiders the domain name, counting the number of internal and external links.

## How to use this application
Download the source code.
run `bundle install`

run `rails c` to load the rails console.

run `PublisherCrawler.new().perform([domain])` to crawl the domain.

in a different terminal window run rails s to start the application in development mode.
You can see a basic list of the Website and DomainCountry records at http://localhost:3000

To run the tests type:
`rspec spec`

## Docker
If you have docker installed you can use that to run the application rather than install the gems etc on you local machine.

From the application root type:

`make build`

This will build the docker image

Type:

`make run-dev`

This will run the rails application in development mode.

Type:
`make run-console` to run the rails console in development mode