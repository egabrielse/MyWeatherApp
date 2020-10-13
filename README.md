# MyWeatherApp Overview (10/08/20)

## Select cities to view their weather reports
To make a weather report available to view in the app, tap the "+" button, search for a city, and select the the matching suggestion.
The weather forecast overview at the top of the screen reflects the weather of the city at the top of the list. 
Both weather forecast data and city suggestions are provided throught calls to Weather Api.


![Select Cities](./MyWeatherApp/PortfolioGifs/SelectCities.gif)


## View detailed weather report for a selected city
To change the units of measurement for the weather reports, tap the "C/F" button.
To view a detailed weather forecast for a given city, select it from the list.


![View Report Details](./MyWeatherApp/PortfolioGifs/ViewReportDetails.gif)


## Manage list of cities 
Re-order or remove cities in the list. Cities can be removed by swiping or through the edit button.
The weather forecast overview at the top of the screen reflects the weather of the city at the top of the list.


![Manage Cities](./MyWeatherApp/PortfolioGifs/ManageCities.gif)


## Persistent storage
The user's list of cities and unit of measurement preference is store using UserDefaults.


![Persistent Data](./MyWeatherApp/PortfolioGifs/PersistentData.gif)


## Important Note
Currently, you will not be able to use the app as is.
The exact url for making api calls is stored in a file that is ignored by git to protect 
the api key from being overused (there is a limit to the number of requests per key).
To run this on your own, create a free account on https://www.weatherapi.com
and input your api key in the urls in the ApiCalls.swift file.

## Future Plans
If I have time, there are a few things I'd like to implement:
- Use CoreLocation to get the weather report for the user's actual current location.
- Force update the weather reports if they have become stale. Weather Api updates about every 10-20 min it seems.
- Learn more about SwiftUI's testing framework.

## Sources
#### AppIcon
Source: https://www.pngitem.com/middle/hToTRob_weather-icon-png-image-weather-app-icon-transparent/
Contributor: Genny Capuozzo

#### Resizing Tool
Used to create a set of app icons of varying sizes.
https://appiconmaker.co/Home/Index/bbf60fa5-ded9-42c4-bd57-bab86e70a49d

#### Weather Api 
https://www.weatherapi.com/


