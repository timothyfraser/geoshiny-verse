## README

### `geoshiny-verse`

A modified `rocker` (R-enabled Docker Container) that allows you to run ShinyApps with the `sf` package. 
In other words, it's `rocker/geospatial` with `rocker/shiny-verse` built on top of it!

All kudos go to the authors of `rocker/geospatial` and `rocker/shiny-verse`, who have made my life so much easier as a dashboard developer.

For more information, see:

- https://hub.docker.com/r/rocker/geospatial

- https://hub.docker.com/r/rocker/shiny-verse

By default, your app will load to the index page (localhost). You'll need to mount your app as `app`, and then your app will be available at `localhost/app`.