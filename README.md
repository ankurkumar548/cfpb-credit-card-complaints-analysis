# CFPB Credit Card Complaints Analysis

## 📌 Project Overview

This project analyzes **credit card consumer complaints** from the **Consumer Financial Protection Bureau (CFPB)** to identify complaint trends, major customer issues, company-level patterns, geographic distribution, response behavior, and operational performance.

The project follows a complete data analytics workflow:

**Raw Data → Python Cleaning → MySQL Analysis → Power BI Dashboard → Business Insights**

The main objective is to convert raw complaint data into meaningful insights that can help understand:

* Which companies receive the most complaints
* Which issues and sub-issues occur most frequently
* How complaints vary across states
* How complaint volume changes over time
* Which channels customers use to submit complaints
* Whether companies provide timely responses
* How long complaints take to be sent to companies

---

## 🛠️ Tools & Technologies

* Python
* Pandas
* NumPy
* MySQL
* SQL
* Power BI
* Power Query
* DAX
* Jupyter Notebook
* Data Cleaning
* Data Transformation
* Exploratory Data Analysis
* Dashboard Development

---

## 🔄 Project Workflow

```text
CFPB Credit Card Complaint Dataset
            ↓
       Python / Pandas
   Data Cleaning & Transformation
            ↓
           MySQL
      SQL Data Analysis
            ↓
         Power BI
 Dashboard + KPI Development
            ↓
      Business Insights
```

---

## 📂 Dataset

The dataset contains consumer complaints related to credit card products.

Important fields used in the project include:

* Complaint ID
* Date Received
* Date Sent to Company
* Product
* Sub-product
* Issue
* Sub-issue
* Company
* State
* ZIP Code
* Submitted Via
* Company Response to Consumer
* Timely Response
* Consumer Complaint Narrative
* Company Public Response
* Tags

---

# 🧹 Data Cleaning Using Python

The raw dataset was cleaned and transformed using **Python and Pandas**.

## 1. Standardizing Column Names

Column names were cleaned by:

* Removing extra spaces
* Converting names to lowercase
* Replacing spaces with underscores
* Removing unnecessary special characters

```python
df.columns = (
    df.columns
      .str.strip()
      .str.lower()
      .str.replace(" ", "_")
      .str.replace("?", "", regex=False)
)
```

---

## 2. Date Conversion

The following columns were converted into datetime format:

* `date_received`
* `date_sent_to_company`

```python
df["date_received"] = pd.to_datetime(
    df["date_received"],
    errors="coerce",
    utc=True
)

df["date_sent_to_company"] = pd.to_datetime(
    df["date_sent_to_company"],
    errors="coerce",
    utc=True
)
```

---

## 3. Handling Missing Values

Missing categorical values were replaced with meaningful labels.

```python
categorical_columns = [
    "sub_product",
    "sub_issue",
    "company_public_response",
    "state",
    "zip_code",
    "tags"
]

for col in categorical_columns:
    df[col] = df[col].fillna("Not Provided")
```

Missing consumer complaint narratives were handled separately.

```python
df["consumer_complaint_narrative"] = (
    df["consumer_complaint_narrative"]
    .fillna("Narrative Not Available")
)
```

---

## 4. Text Standardization

Important categorical columns were standardized by removing unnecessary spaces and cleaning text formatting.

Columns included:

* Product
* Sub-product
* Issue
* Sub-issue
* Company
* State
* Submitted Via
* Company Response to Consumer
* Timely Response

---

## 5. ZIP Code Cleaning

ZIP codes were standardized by:

* Converting values to strings
* Removing `.0`
* Keeping valid 3–5 digit ZIP codes
* Replacing invalid or missing values with `Not Provided`

---

## 6. Timely Response Cleaning

The `timely_response` column was standardized to:

```text
Yes
No
Unknown
```

Unexpected values were classified as `Unknown`.

---

## 7. Duplicate Removal

Duplicate complaints were removed using the unique complaint ID.

```python
df = df.drop_duplicates(subset=["complaint_id"])
```

---

# ⚙️ Feature Engineering

Additional columns were created to support time-based and operational analysis.

## Date Features

```python
df["received_year"] = df["date_received"].dt.year
df["received_month"] = df["date_received"].dt.month
df["month_name"] = df["date_received"].dt.month_name()
df["received_quarter"] = "Q" + df["date_received"].dt.quarter.astype(str)
df["day_name"] = df["date_received"].dt.day_name()
```

These features allow complaints to be analyzed by:

* Year
* Month
* Quarter
* Day of week

---

## Days to Send

A new operational metric called `days_to_send` was created.

```python
df["days_to_send"] = (
    df["date_sent_to_company"] - df["date_received"]
).dt.days
```

This measures the number of days between:

**Complaint Received → Complaint Sent to Company**

It helps analyze complaint-processing efficiency.

---

# 🗄️ SQL Analysis Using MySQL

After cleaning, the dataset was loaded into MySQL for further analysis.

Example table:

```text
cfpb_credit_card_complaints_2024_cleaned
```

---

## Total Complaints

```sql
SELECT COUNT(*) AS total_complaints
FROM cfpb_credit_card_complaints_2024_cleaned;
```

---

## Complaints by Company

```sql
SELECT
    company,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY company
ORDER BY complaint_count DESC;
```

---

## Complaints by State

```sql
SELECT
    state,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY state
ORDER BY complaint_count DESC;
```

---

## Most Common Issues

```sql
SELECT
    issue,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY issue
ORDER BY complaint_count DESC;
```

---

## Most Common Issue and Sub-Issue Combinations

```sql
SELECT
    issue,
    sub_issue,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY issue, sub_issue
ORDER BY complaint_count DESC;
```

---

## Complaints by Month

```sql
SELECT
    received_month,
    month_name,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY received_month, month_name
ORDER BY received_month;
```

---

## Complaints by Submission Channel

```sql
SELECT
    submitted_via,
    COUNT(*) AS complaint_count
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY submitted_via
ORDER BY complaint_count DESC;
```

---

## Timely Response Rate

```sql
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN timely_response = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS timely_response_rate
FROM cfpb_credit_card_complaints_2024_cleaned;
```

---

## Average Days to Send Complaint

```sql
SELECT
    AVG(days_to_send) AS avg_days_to_send
FROM cfpb_credit_card_complaints_2024_cleaned
WHERE days_to_send > 0;
```

---

# 📊 Power BI Dashboard

The cleaned dataset was used to create interactive Power BI dashboards.

The dashboard focuses on:

* Complaint volume
* Company performance
* Complaint issues
* Geographic distribution
* Submission channels
* Response behavior
* Time trends
* Operational KPIs

---

## 📈 KPI Cards

Important KPIs include:

* Total Complaints
* Timely Response Rate
* Average Days to Send
* Number of Companies
* Number of States
* Most Common Complaint Issue

---

# 📅 Date Table

A dedicated Date Table was created using DAX.

```DAX
DateTable =
CALENDAR(
    MIN(Complaints[date_received]),
    MAX(Complaints[date_received])
)
```

Additional columns:

```DAX
Year = YEAR(DateTable[Date])

Month Number = MONTH(DateTable[Date])

Month Name = FORMAT(DateTable[Date], "MMMM")

Quarter = "Q" & FORMAT(DateTable[Date], "Q")

Day Name = FORMAT(DateTable[Date], "dddd")
```

`Month Name` was sorted using `Month Number` to maintain chronological order.

---

# 📊 Dashboard Analysis

## Complaint Overview

Provides an overview of:

* Total complaints
* Timely response rate
* Average complaint forwarding time
* Overall complaint trends

---

## Company Analysis

Identifies:

* Companies receiving the highest number of complaints
* Differences in complaint volume between companies
* Companies requiring deeper investigation

---

## Issue Analysis

Analyzes:

* Most common complaint issues
* Most common sub-issues
* Issue and sub-issue combinations

This helps identify major customer pain points.

---

## Geographic Analysis

Complaint distribution is analyzed across different states.

This helps identify:

* States with higher complaint concentration
* Geographic complaint patterns
* Areas requiring further investigation

---

## Time-Series Analysis

Complaints are analyzed by:

* Month
* Quarter
* Day of week

This helps identify:

* Complaint trends
* Seasonal patterns
* Sudden complaint spikes

---

## Submission Channel Analysis

The dashboard analyzes how consumers submit complaints through channels such as:

* Web
* Phone
* Referral
* Postal Mail
* Other available channels

---

# 🔍 Key Analytical Questions

This project helps answer questions such as:

1. Which companies receive the most credit card complaints?
2. Which states report the highest complaint volume?
3. What are the most common complaint issues?
4. Which sub-issues appear most frequently?
5. How does complaint volume change over time?
6. Which submission channels are used most often?
7. What percentage of complaints receive timely responses?
8. How long does it take for complaints to be sent to companies?
9. Which companies or issues are driving complaint spikes?
10. Which areas require deeper customer-service investigation?

---

# 💡 Business Value

The analysis can help decision-makers:

* Monitor complaint trends
* Identify recurring customer pain points
* Compare complaint volumes across companies
* Monitor response performance
* Identify geographic complaint concentration
* Prioritize high-frequency issues
* Support customer-service improvement initiatives
* Identify areas requiring root-cause analysis

---

# 📁 Repository Structure

```text
cfpb-credit-card-complaints-analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   │   └── cfpb_credit_card_complaints_2024.csv
│   │
│   └── cleaned/
│       └── cfpb_credit_card_complaints_2024_cleaned.csv
│
├── notebooks/
│   └── data_cleaning.ipynb
│
├── sql/
│   └── complaint_analysis.sql
│
├── powerbi/
│   └── cfpb_credit_card_complaints_dashboard.pbix
│
├── images/
│   ├── dashboard-overview.png
│   ├── company-analysis.png
│   └── complaint-trends.png
│
└── docs/
    └── project-notes.md
```

---

# 🚀 How to Run the Project

## Python

Install the required libraries:

```bash
pip install pandas numpy jupyter
```

Start Jupyter Notebook:

```bash
jupyter notebook
```

Open:

```text
notebooks/data_cleaning.ipynb
```

---

## MySQL

1. Create a MySQL database.
2. Import the cleaned dataset.
3. Run:

```text
sql/complaint_analysis.sql
```

---

## Power BI

1. Open the `.pbix` file using Microsoft Power BI Desktop.
2. Update the data source path if required.
3. Refresh the dataset.
4. Use the available filters and slicers to explore complaint patterns.

---

# 🎯 Skills Demonstrated

* Python
* Pandas
* NumPy
* Data Cleaning
* Data Transformation
* Feature Engineering
* MySQL
* SQL
* GROUP BY
* CASE WHEN
* Aggregations
* Date Analysis
* Power BI
* Power Query
* DAX
* KPI Development
* Dashboard Design
* Exploratory Data Analysis
* Business Analytics

---

# 🔮 Future Improvements

Possible future improvements include:

* Complaint rate normalization by company customer base
* Complaint rate normalization by state population
* Company response comparison
* Complaint narrative text analysis
* Sentiment analysis
* Topic modelling
* Automated Power BI refresh
* Trend anomaly detection
* Complaint forecasting
* Root-cause drill-down analysis

---

# 👤 Author

**Ankur Kumar**
B.Tech
National Institute of Technology Agartala

---

## ⚠️ Disclaimer

This project is intended for **educational, portfolio, and data analytics demonstration purposes**.

The analysis uses CFPB complaint data. Complaint volume alone should not be interpreted as a direct measure of company quality because companies may differ significantly in customer base, transaction volume, and market share.
