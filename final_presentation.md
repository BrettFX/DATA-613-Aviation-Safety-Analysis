# Final Presentation Storyboard
## Aviation Safety Analysis: What Risks Remain?

**Central Question:** *"Aviation is statistically the safest mode of travel, but what do decades of NTSB accident data reveal about the risks that still remain?"*

**Dataset:** 88,889 NTSB aviation accident records spanning 1948–2022


---

## Slide 1 — Title Slide

- **Title:** Aviation Safety Analysis: Uncovering the Risks That Remain
- **Subtitle:** A Deep Dive into Decades of NTSB Accident Data
- **Team/Course:** DATA 621 - Data Communication and Visualization
- **Date:** Fall 2025

---

## Slide 2 — The Safety Paradox: 74 Years of Trends

![Accident Trends Over Time](presentation_assets/01_accident_trends_over_time.png)

- Aviation is statistically the safest mode of transportation
- Yet between 1948–2022, the NTSB recorded **88,889 accidents** in the United States alone
- Peak accident period: Early 1980s with ~2,400 substantial damage accidents/year
- **Post-1985:** Consistent 50% decline due to regulatory improvements, technology, and training
- **2015–2022:** Lowest accident rates in the entire 74-year dataset (~1,100/year)
- **Key Insight:** Substantial damage consistently dominates—most accidents are survivable
---

## Slide 3 — Where Accidents Happen: Geographic Hotspots

![Geographic Distribution by Severity](presentation_assets/02_geographic_distribution_severity.png)

- Accidents are **NOT randomly distributed**—they cluster geographically
- **Hotspots:** California, Florida, Texas, Alaska, and the Northeast corridor
- Color-coding reveals fatal accidents (red) occur nationwide, but concentrate in:
  - High general aviation activity zones
  - Challenging terrain areas (mountains, wilderness)
  - Diverse weather environments
- **Insight:** Geographic and operational factors create persistent risk zones
---

## Slide 5 — Top States by Accident Volume

![Top 15 States by Accidents](presentation_assets/13_top_states_accidents.png)

- **Top 5 States by Volume:**
  1. California: 8,857 accidents
  2. Texas: 5,913 accidents
  3. Florida: 5,825 accidents
  4. Alaska: 5,672 accidents
  5. Arizona: 2,834 accidents
- **Important Context:** High counts reflect **flight activity** and population, not necessarily poor safety
- California dominates general aviation and flight training markets
- Alaska's high ranking reflects challenging terrain and unique operational demands
---

## Slide 6 — Fatal Accidents: Where Lives Are Lost

![Fatal Accidents Bubble Map](presentation_assets/04_fatal_accidents_bubble_map.png)

- Fatal accidents mapped with bubble size proportional to fatalities
- Average fatalities per fatal accident: 2.41
- Larger bubbles reveal mass-casualty events, while small bubbles show single-fatality general aviation crashes
- **Geographic pattern persists:** Alaska, California, Florida dominate
- **Key Insight:** Despite safety improvements, fatal accidents remain concentrated in specific operational environments
---

## Slide 7 — Weather: The Hidden Multiplier

![Weather Impact on Severity](presentation_assets/05_weather_impact_severity.png)

- **VMC (Visual Meteorological Conditions):** Most accidents occur in good weather
  - 77% of all accidents, but lower fatality proportion
  - Reflects higher flight activity in good conditions
- **IMC (Instrument Meteorological Conditions):** Only 7% of accidents, BUT:
  - **57.9% result in fatalities** vs. 15.9% for VMC
  - Flying in IMC is **3.6x more likely** to result in death
- **The Paradox:** Good weather = more accidents; Bad weather = deadlier accidents
---

## Slide 8 — IMC vs VMC: Spatial Comparison

![IMC vs VMC Comparison](presentation_assets/06_imc_vs_vmc_comparison.png)

- **IMC Fatal Rate:** 57.9% of IMC accidents result in fatalities
- **VMC Fatal Rate:** 15.9% of VMC accidents result in fatalities
- **IMC is 3.6x more likely to be fatal** than VMC
- Side-by-side maps show:
  - IMC accidents appear more dispersed—pilots encounter weather far from airports
  - VMC accidents cluster near airports and high-traffic areas
- **Root Cause:** Spatial disorientation, loss of control, inadequate instrument proficiency

---

## Slide 9 — When Accidents Happen: Flight Phase Analysis

![Flight Phase Analysis](presentation_assets/07_flight_phase_analysis.png)

- **Landing:** Highest frequency of accidents (15,000+)
- **Takeoff:** Second highest (12,500+)
- **Combined critical phases = 47%** of all accidents
- **BUT:** Cruise and Climb have **higher fatality rates** (0.6-0.9 per accident) despite lower frequency
- **Insight:** Most accidents near ground; deadliest accidents at altitude

---

## Slide 10 — Engine Type Analysis: Who's at Risk?

![Engine Type Analysis](presentation_assets/08_engine_type_analysis.png)

- **Reciprocating Engines (General Aviation): 78% of ALL accidents**
  - Landing: 13,804 accidents (32.5%)
  - Takeoff: 11,127 accidents (26.2%)
  - Piston aircraft = highest risk population
- **Turbine Engines (Commercial/Professional):**
  - More evenly distributed across phases
  - Turbo Shaft (helicopters) unique: Cruise phase dominates
  - Better reliability and performance consistency
- **Key Insight:** Remaining risks concentrate in general aviation, not commercial flights

---

## Slide 11 — Decade-by-Decade: The Safety Evolution

![Decade Evolution](presentation_assets/09_decade_evolution.png)

- **1980s–1990s:** Sparse data in geo-coded records, limited visibility
- **2000s:** Peak visibility with 11,446 accidents showing full geographic distribution
- **2010s–2020s:** Lowest accident rates in recorded history
- **Geographic patterns persist:** CA, TX, FL, AK remain hotspots across ALL decades
- **Key Insight:** Frequency reduced, but location-specific risks unchanged
---

## Slide 12 — Machine Learning: Risk Zones Identified

![K-Means Clustering](presentation_assets/10_kmeans_clustering.png)

- **Machine learning identifies 12 distinct geographic risk zones** (K-Means clustering)
- Cluster centers (red stars) mark the "heart" of each risk zone
- Risk zones combine: accident frequency + fatality rates + spatial density
- **Highest-risk clusters:** 
  - Pacific Northwest
  - California Central Valley
  - Texas Triangle
  - Florida Peninsula
  - Gulf Coast
- **Insight:** Data-driven cluster analysis confirms subjective geographic observations
---

## Slide 13 — Seasonal Patterns: When Risk Peaks

![Seasonal Patterns](presentation_assets/11_seasonal_patterns.png)

- **Summer (June–August):** Peak accident months
  - July: 1,372 accidents (highest)
  - June: 1,260 accidents
  - August: 1,237 accidents
- **Winter (December–February):** Lowest accident rates
  - February: 610 accidents (lowest)
  - January: 624 accidents
- **Summer has nearly 2x the accident rate** of winter
- **Explanation:** Higher recreational flying activity, not worse conditions

---

## Slide 14 — Survival Analysis: The Bimodal Reality

![Survival Rate Distribution](presentation_assets/12_survival_rate_distribution.png)

- **Bimodal survival distribution:** Accidents tend to be either highly survivable or fatal
- Two peaks visible:
  - **~0% survival:** ~23,000 accidents (fatal outcomes)
  - **~100% survival:** ~59,000 accidents (highly survivable)
- The "all or nothing" nature of aviation incidents
- Few accidents fall in the middle survival range
- **Key Insight:** When safety barriers fail, consequences are often severe

---

## Slide 15 — Conclusions: What Risks Remain?

**Despite aviation being statistically the safest travel mode, our analysis reveals five persistent risk categories:**

1. **Weather-Related Risks**
   - IMC operations are 3.6x more likely to be fatal
   - Spatial disorientation and loss of control remain primary failure modes

2. **Critical Flight Phases**
   - Landing and takeoff account for 47% of all accidents
   - Transition between ground and air is inherently hazardous

3. **Geographic Vulnerabilities**
   - California, Texas, Florida, Alaska dominate across all time periods
   - Challenging terrain and remote operations amplify severity

4. **General Aviation Focus**
   - 78% of accidents involve reciprocating engine (piston) aircraft
   - Commercial aviation has benefited most from safety advances

5. **Seasonal & Operational Context**
   - Summer months show nearly 2x accident rates
   - Activity-driven exposure correlates with incident probabilityd
---

## Slide 16 — Recommendations
**Targeted Interventions Based on Our Analysis:**

1. **Enhance IMC Training Requirements**
   - Increase instrument proficiency standards for general aviation pilots
   - Focus on spatial disorientation recognition and recovery

2. **Strengthen Critical Phase Procedures**
   - Emphasize stabilized approach criteria and go-around decision-making
   - Improve runway safety technology at smaller airports

3. **Geographic Risk Mitigation**
   - Deploy safety resources to identified high-risk clusters (12 zones identified)
   - Enhance emergency response capabilities in Alaska and remote regions

4. **General Aviation Safety Campaigns**
   - Target recreational pilots with risk awareness programs
   - Promote flight review emphasis on weather decision-making

5. **Data-Driven Monitoring**
   - Use spatial clustering to track emerging risk zones
   - Leverage NLP on incident narratives for early pattern detection

---