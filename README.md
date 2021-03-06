firebehavioR
================

Fire behavior prediction models, including the Scott & Reinhardt's (2001) Rothermel Wildland Fire Modelling System [DOI:10.2737/RMRS-RP-29](https://www.fs.usda.gov/treesearch/pubs/4623) and Alexander et al.'s (2006) Crown Fire Initiation & Spread model [DOI:10.1016/j.foreco.2006.08.174](https://www.sciencedirect.com/science/article/pii/S0378112706006839?via%3Dihub). Also contains sample datasets, estimation of fire behavior prediction model inputs (e.g., fuel moisture, canopy characteristics, wind adjustment factor), results visualization, and methods to estimate fire weather hazard.

Features
--------

Fire behavior predictions using:
* the Rothermel modelling system, similar to BehavePlus, NEXUS, and FuelCalc
* the Crown Fire Initiation & Spread modelling system

Fire weather indices of two types:
* Static (uses instantaneous weather data)
* Dynamic (evolving index value based on continuous daily weather data)

Helper functions which can:
* Calculate the wind adjustment factor, using a little or a lot of site-specific forest canopy information
* Predict canopy fuels characteristics such as canopy bulk density and canopy fuel load
* Determine fine fuel moisture from meteorological observations
* Plot fire behavior outputs onto the Fire Characteristics Chart

Helper data:
* Stylized surface fuel models
* Surface fuel moisture scenarios

Installation
------------

You can install firebehavioR from GitHub for the development version.

    devtools::install_github("EcoFire/firebehavioR")

The fireplot() function requires ggplot2; otherwise there are no package dependencies. You should have R (&gt;= 3.4.1) installed.

Usage
-----

The vignette in the above references GitHub repo will help you get up and going.

Future Development
-----

This package is a continual work in progress. Suggestions for improvements are welcomed. Currently, additional helper functions are planned: 
* Incorporation of models to estimate ~~dead and~~ live fuel moistures using RAWS weather observations 
* Additional methods to estimate canopy fuels characteristics
* ~~Visual interpretation of fire behavior results via the Fire Characteristics Chart~~

Authors
-------

-   **Justin Ziegler** - developer and maintainer, <Justin.Ziegler@Colostate.edu>

License
-------

GPL (&gt;= 2)
