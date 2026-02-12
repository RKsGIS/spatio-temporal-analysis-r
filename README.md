# Spatio-Temporal Analysis: Health Facilities in the Amazon 

A spatial data science project investigating the relationship between urbanization, population density, and the distribution of healthcare infrastructure in the Brazilian Amazon.

This project evaluates whether health facilities are spatially clustered and how their distribution relates to urban expansion and population arrangements between 2005 and 2015.


---

## Overview

The study applies spatial data processing and point pattern analysis techniques to examine the allocation of healthcare services across the Amazon region of Brazil.

### Research Hypothesis

There is a significant positive relationship between the number of health facilities and population density and urbanization in the Brazilian Amazon.

---

## Methodology

- Acquisition of official spatial datasets using the `geobr` R package
- Spatial filtering to isolate the Amazon region
- Intersection of health facilities, population data, and urban extents
- Conversion of health facility locations into point pattern objects
- Application of Ripley’s K-function to test spatial clustering
- Comparison of urban area changes between 2005 and 2015

---

## Key Findings

- Health facilities are not randomly distributed across the Amazon.
- Ripley’s K-function indicates spatial clustering at shorter distances.
- Urban expansion between 2005 and 2015 shows spatial dependence with facility concentration.
- Health infrastructure is strongly associated with populated and urbanized zones.

---

## Tech Stack



- geobr
- sf
- lwgeom
- spatstat
- leaflet
- dplyr

Data Source:
- IBGE (Brazilian Institute of Geography and Statistics) via the `geobr` package

---

## Project Structure

```
spatio-temporal-analysis-r/
├── spatio_temporal_amazon_project.Rmd   # Main R Markdown analysis
├── docs/                                # Rendered HTML report
├── data/                                # Processed spatial data
└── README.md
```

---


## Full Project Report

The complete rendered HTML report is available via [GitHub Page](https://rksgis.github.io/spatio-temporal-analysis-r/spatio_temporal_amazon_project.html)
---

## Author
- [Ram Kumar Muthusamy](mailto:ramkumar.m@uni-muenster.de)


Developed as part of the course *Analysis of Spatio-Temporal Data*.
