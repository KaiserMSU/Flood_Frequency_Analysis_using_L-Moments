Dataset Title: Hydrological Dataset on Flood Magnitude and Recurrence Analysis across Kansas, Iowa, Nebraska, and Missouri (1960–2020)
Author(s): Kaiser Mostafiz
Affiliation: Missouri State University, Ozarks Environmental and Water Resources Institute (OEWRI)
Contact Email: km4359s@missouristate.edu
Date of Publication: 2025-11-06
Version: 1.0
License: Creative Commons Attribution 4.0 International (CC BY 4.0)
DOI: https://doi.org/10.5281/zenodo.17546764

------------------------------------------------------------
1. Dataset Overview
------------------------------------------------------------
This dataset contains the results of a long-term flood frequency and magnitude analysis for the Lower Missouri River Basin, which includes portions of Missouri, Kansas, Iowa, and Nebraska. The data were obtained from the U.S. Geological Survey (USGS) National Water Information System (NWIS) and span the years 1960–2020.

The dataset includes four tabular files (available in .csv and .xlsx formats) documenting the full data lineage—from initial raw records to cleaned time series and final analytical outputs. The study supports hydrologic research on climate-driven changes in flood recurrence and magnitude using the Log-Pearson Type III distribution as per Bulletin 17C guidelines.

------------------------------------------------------------
2. File Descriptions
------------------------------------------------------------

### File 1: Raw Annual Peak Flow Records (1960–2020)
Contains unfiltered annual peak discharge data for 1,452 USGS gaging stations prior to cleaning and quality control.

| Variable Name | Description | Units | Data Type |
|----------------|-------------|--------|------------|
| Site Number | Unique USGS Gaging Station ID | N/A | String |
| Peak Date | Date of maximum annual peak flow | YYYY-MM-DD | Date |
| Peak Time | Time of maximum annual peak flow | HH:MM | Time |
| Peak Value | Raw annual peak discharge | cfs | Float |
| Gage Height | Water surface height at peak flow | meters (m) | Float |

---

### File 2: Cleaned Annual Peak Flow Time Series (191 Stations)
Finalized annual peak flow time series for 191 stations meeting continuity criteria (1960–2020), used in flood frequency analysis.

| Variable Name | Description | Units | Data Type |
|----------------|-------------|--------|------------|
| Station ID | Unique USGS Gaging Station ID | N/A | String |
| Annual Peak Value | Cleaned annual peak discharge | cfs | Float |

---

### File 3: Flood Magnitude Quantiles (Main Data Product)
Calculated flood magnitudes (Q-values) for six recurrence intervals (2, 5, 10, 25, 50, and 100 years) for two climatic periods:  
Period 1 (1960–1990) and Period 2 (1991–2020).

| Variable Name | Description | Recurrence Interval | Units |
|----------------|-------------|---------------------|--------|
| Site Number | USGS Gaging Station ID | N/A | N/A |
| Q2 | Flood magnitude for 2-year recurrence (50% AEP) | 2-year | cfs |
| Q5 | Flood magnitude for 5-year recurrence (20% AEP) | 5-year | cfs |
| Q10 | Flood magnitude for 10-year recurrence (10% AEP) | 10-year | cfs |
| Q25 | Flood magnitude for 25-year recurrence (4% AEP) | 25-year | cfs |
| Q50 | Flood magnitude for 50-year recurrence (2% AEP) | 50-year | cfs |
| Q100 | Flood magnitude for 100-year recurrence (1% AEP) | 100-year | cfs |

---

### File 4: Recurrence Interval Exceedance Counts
Compares the number of peak flow events exceeding given thresholds between the two climatic periods.

| Variable Name | Description | Threshold Range (based on Period 1 Q) | Data Type |
|----------------|-------------|--------------------------------------|------------|
| Station ID | USGS Gaging Station ID | N/A | String |
| Count 2-5, P1 | Events in Period 1 exceeding Q2–Q5 | Q2 < Qpeak ≤ Q5 | Integer |
| Count 2-5, P2 | Events in Period 2 exceeding Q2–Q5 | Q2 < Qpeak ≤ Q5 | Integer |
| Count 5-10, P1 | Events in Period 1 exceeding Q5–Q10 | Q5 < Qpeak ≤ Q10 | Integer |
| Count 5-10, P2 | Events in Period 2 exceeding Q5–Q10 | Q5 < Qpeak ≤ Q10 | Integer |
| Count 10-25, P1 | Events exceeding Q10–Q25 | Q10 < Qpeak ≤ Q25 | Integer |
| Count 10-25, P2 | Events exceeding Q10–Q25 | Q10 < Qpeak ≤ Q25 | Integer |
| Count 25-50, P1 | Events exceeding Q25–Q50 | Q25 < Qpeak ≤ Q50 | Integer |
| Count 25-50, P2 | Events exceeding Q25–Q50 | Q25 < Qpeak ≤ Q50 | Integer |
| Count 50-100, P1 | Events exceeding Q50–Q100 | Q50 < Qpeak ≤ Q100 | Integer |
| Count 50-100, P2 | Events exceeding Q50–Q100 | Q50 < Qpeak ≤ Q100 | Integer |
| Count >100, P1 | Events exceeding Q100 | Qpeak > Q100 | Integer |
| Count >100, P2 | Events exceeding Q100 | Qpeak > Q100 | Integer |

------------------------------------------------------------
3. Data Sources
------------------------------------------------------------
All raw peak discharge data were obtained from the U.S. Geological Survey (USGS) National Water Information System (NWIS). Derived products follow Bulletin 17C guidelines for flood frequency analysis using the Log-Pearson Type III distribution.

------------------------------------------------------------
4. Spatial and Temporal Coverage
------------------------------------------------------------
- Geographic Extent: Lower Missouri River Basin (Missouri, Kansas, Iowa, Nebraska)
- Temporal Coverage: 1960–2020
- Coordinate Reference System: WGS 1984 (EPSG:4326)

------------------------------------------------------------
5. Methodology Summary
------------------------------------------------------------
Flood frequency analysis was performed using the Log-Pearson Type III distribution as per U.S. Water Resources Council Bulletin 17C. The analysis compares two climatic periods (1960–1990 and 1991–2020). R (lmomco package) was used for data processing, quantile estimation, and validation.

------------------------------------------------------------
6. Recommended Citation
------------------------------------------------------------
Mostafiz, K. (2025). Hydrological Dataset on Flood Magnitude and Recurrence Analysis across Kansas, Iowa, Nebraska, and Missouri (1960–2020) [Data set]. Missouri State University, OEWRI. Zenodo. https://doi.org/[to be assigned]

------------------------------------------------------------
7. Keywords
------------------------------------------------------------
Hydrology; Flood Frequency; Peak Flow; Log-Pearson Type III; Missouri River Basin; Climate Change; Streamflow; USGS; Hydroclimatology
