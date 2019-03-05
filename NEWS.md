firebehavioR development
========================

# firebehavior 0.1.2

- Two modifications to rothermel(). 
  - Previously, if an input data frame had more than one row,  rothermel() would solve for Crowning Index for only the first row of input data. This has been fixed.
  - A constant used for unit conversion was corrected in the function. This will result is a slightly different Crowning Index.
- One modification to fireChart(). 
    - Previously, fireChart() could only plot one fire whereas the documentation led the user to believe multiple fires could be plotted on a fireChart. This has been fixed to allow for multiple fires.

firebehavior 0.1.1
==================

-   Revision in anticipation of CRAN submission
