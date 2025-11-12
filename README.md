# Aviation Accident NLP Analysis & Power BI Dashboard  
*A Data Storytelling Project on Human Factors in Aviation Safety*

![Python](https://img.shields.io/badge/Python-3.12+-blue.svg)
![PowerBI](https://img.shields.io/badge/Power%20BI-Interactive%20Dashboard-yellow.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## Overview
This project analyzes **NTSB aviation accident reports** using **Natural Language Processing (NLP)** and **Power BI** to uncover recurring patterns, themes, and sentiments within accident narratives.  
It was developed as part of a **Data Visualization & Communication** class project focused on *data storytelling for impact*.

**Dataset:**  
[Aviation Accident NTSB Dataset – Kaggle (Yasser Eleraky)](https://www.kaggle.com/datasets/yassereleraky/aviation-accident-ntsb/data?select=NTSB_database.csv)

**Objective:**  
> Explore structured and unstructured aviation safety data to identify what factors—human, environmental, or technical—drive recurring accident trends, and communicate findings through a Power BI dashboard.

---

## Repository Structure
```
aviation-nlp-powerbi/
├── data/
│   ├── NTSB_database.csv          # Raw Kaggle dataset
│   ├── cleaned_ntsb.csv           # Cleaned version (Python)
│   └── enriched_ntsb_nlp.csv      # Final dataset for Power BI
├── notebooks/
│   ├── 01_cleaning.ipynb          # Data cleanup & exploration
│   ├── 02_nlp_processing.ipynb    # Sentiment, TF-IDF, topics
│   └── 03_export_powerbi.ipynb    # Power BI export prep
├── outputs/
│   ├── wordclouds/                # Saved word cloud images
│   └── sentiment_results.csv
├── powerbi/
│   └── Aviation_Dashboard.pbix    # Final interactive dashboard
└── README.md
```

---

## Setup & Installation

### 1) Clone the Repository
```bash
git clone https://github.com/<your-username>/aviation-nlp-powerbi.git
cd aviation-nlp-powerbi
```

### 2) Create & Activate a Virtual Environment
```bash
python -m venv venv
source venv/bin/activate        # (Mac/Linux)
venv\Scripts\activate           # (Windows)
```

### 3) Install Dependencies
```bash
pip install -r requirements.txt
python -m spacy download en_core_web_sm
```

*(Example dependencies: `pandas`, `numpy`, `nltk`, `spacy`, `textblob`, `sklearn`, `bertopic`, `wordcloud`)*

---

## Data Cleaning Workflow

**Notebook:** `notebooks/01_cleaning.ipynb`  
- Drop missing narratives and irrelevant columns  
- Standardize column names and date formats  
- Extract year, latitude, longitude  
- Save as `cleaned_ntsb.csv`

```python
df = df.dropna(subset=["narrative"])
df["event_date"] = pd.to_datetime(df["event_date"], errors="coerce")
df["year"] = df["event_date"].dt.year
```

---

## NLP Processing

**Notebook:** `notebooks/02_nlp_processing.ipynb`

### Sentiment Analysis
Using **TextBlob**:
```python
from textblob import TextBlob
df["sentiment_polarity"] = df["narrative"].apply(lambda x: TextBlob(x).sentiment.polarity)
```

### Keyword Extraction (TF-IDF)
```python
from sklearn.feature_extraction.text import TfidfVectorizer
vectorizer = TfidfVectorizer(max_df=0.8, min_df=10, stop_words="english")
tfidf_matrix = vectorizer.fit_transform(df["narrative_clean"])
```

### Topic Modeling (Optional)
Using **BERTopic**:
```python
from bertopic import BERTopic
topic_model = BERTopic(language="english")
topics, probs = topic_model.fit_transform(df["narrative_clean"])
df["topic"] = topics
```

### Export for Power BI
```python
df.to_csv("data/enriched_ntsb_nlp.csv", index=False)
```

---

## Power BI Dashboard

**File:** `powerbi/Aviation_Dashboard.pbix`

### Key Visuals
| Section | Visual | Fields |
|----------|--------|--------|
| Overview KPIs | Card visuals | # Accidents, Fatal %, Avg Sentiment |
| Trend Over Time | Line chart | Accidents by Year |
| Map | ArcGIS Map | Latitude, Longitude, Severity |
| Flight Phase | Bar Chart | `broad_phase_of_flight` |
| Sentiment Breakdown | Donut Chart | `sentiment_category` |
| Word Cloud | Custom Visual | Keyword frequency |
| Topics | Table or Bar | BERTopic results |

### Interactivity
- **Filters:** Year, Aircraft Type, Weather  
- **Tooltips:** Narrative excerpts on hover  
- **Drill-throughs:** View full accident report text  

---

## Executive Summary
**Title:** *Human Factors in Aviation Accidents: Insights from NTSB Narratives*  
- Accident counts have **declined steadily** over decades.  
- **Human error** and **weather conditions** remain dominant narrative themes.  
- **Sentiment analysis** reveals negative tone clusters around *takeoff* and *landing* events.  
- Combining NLP with visual analytics provides **new context for aviation safety**.

---

## References
- Kaggle Dataset: [Yasser Eleraky – Aviation Accident NTSB](https://www.kaggle.com/datasets/yassereleraky/aviation-accident-ntsb/data)  
- Medium Inspiration: [Power BI NLP Magic by A. Kapoor](https://medium.com/@a.kapoor1391/power-bi-nlp-magic-2c73276e53ef)  
- NTSB: [Aviation Accident Database & Synopses](https://www.ntsb.gov/_layouts/ntsb.aviation/Query.aspx)

---

## Future Enhancements
- Integrate **transformer-based sentiment models** (BERT/RoBERTa)  
- Add **real-time FAA incident feeds** for dynamic updates  
- Deploy **interactive dashboard to Power BI Service**

---

*“Behind every data point is a human story — this project brings those voices to light.”*
