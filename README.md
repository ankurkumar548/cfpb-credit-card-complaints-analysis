# Retail Sales Performance Analytics Dashboard

## 📌 Project Overview

This project presents an interactive **Power BI Retail Sales Performance Dashboard** developed for a fictional retail company, **Electro Hub**.

The dashboard analyzes **3,510 transactions**, **50 customers**, and **30 products**, representing approximately **₹122.31 million in net sales**.

The main objective of this project is to transform raw retail data into meaningful business insights and help management understand:

- Sales performance
- Profitability
- Product performance
- Category performance
- Sales trends over time
- Discount patterns
- Regional performance
- Top and bottom-performing products

---

## 🎯 Business Questions

The dashboard was designed to answer questions such as:

- Which products generate the highest sales?
- Which products generate the lowest sales?
- Which products generate the highest and lowest profit?
- How do sales change monthly, quarterly, and annually?
- Which categories contribute the most revenue?
- What is the relationship between sales and profit?
- What is the average discount offered across categories?
- How do sales, profit, and quantity sold compare between selected periods?
- Which products and regions perform best?

---

## 📊 Dataset Summary

| Metric | Value |
|---|---:|
| Transactions | 3,510 |
| Customers | 50 |
| Products | 30 |
| Net Sales | ₹122.31M |
| Leading Category | Electronics |
| Electronics Net Sales | ₹90.11M |
| Electronics Revenue Contribution | ~75% |

The dataset contains products from categories including:

- Electronics
- Footwear
- Home Appliances
- Clothing
- Accessories
- Kitchenware
- Bags
- Personal Care

---

## 🛠️ Tools & Technologies

- Microsoft Power BI
- Power Query
- DAX
- Star Schema Data Modelling
- Fact and Dimension Tables
- Top-N Filters
- Slicers
- Maps
- Time-Series Visualizations
- Data Cleaning
- Data Transformation
- Exploratory Data Analysis
- Business Intelligence

---

# 🔄 Data Cleaning & Transformation

Data preparation was mainly performed using **Power Query**.

Important steps included:

- Importing raw data into Power BI
- Checking and correcting data types
- Converting identifier columns to appropriate data types
- Handling missing values
- Merging information from related tables
- Recovering missing price information where required
- Calculating sales-related fields
- Standardizing column names
- Preparing tables for dimensional modelling

---

# ⭐ Data Model

The project uses a **Star Schema**.

## Fact Table

The central Sales / Fact table contains transaction-level information such as:

- Customer ID
- Product ID
- Promotion ID
- Units Sold
- Price per Unit
- Discount
- Sales
- Net Sales
- Profit
- Transaction Date

## Dimension Tables

The project contains dimension tables such as:

- Dim Customer
- Dim Product
- Dim Promotion

The dimension tables are connected to the Sales fact table using **one-to-many relationships**.

---

# 🧮 DAX Measures

DAX was used to create important business KPIs and analytical measures.

Examples include:

- Total Sales
- Net Sales
- Total Profit
- Quantity Sold
- Average Discount
- Category Sales
- Product Sales
- Period Comparison
- Top-N Products
- Bottom-N Products

Example DAX calculation:

```DAX
Total Sales =
SUMX(
    Sales,
    Sales[Price Per Unit] * Sales[Units Sold]
)
```

---

# 📊 Dashboard Screenshots

## Dashboard Overview

![Dashboard Overview](dashboard-overview.jpeg)

The dashboard overview provides a high-level summary of major sales KPIs and helps users quickly understand overall business performance.

---

## Dashboard Filters

![Dashboard Filters](dashboard-filters.jpeg)

Interactive filters and slicers allow users to analyze performance across different products, categories, customers, regions, and periods.

---

## Sales Trend Analysis

![Sales Trend Analysis](sales-trend-analysis.jpeg)

The time-series analysis shows how sales change across different periods and helps identify trends and seasonality.

---

## Period Comparison

![Period Comparison](period-comparison.jpeg)

The period comparison dashboard allows users to compare sales, profit, and quantity sold between two selected time periods.

---

## Sales Comparison

![Sales Comparison](sales-comparison.jpeg)

This section helps compare important business metrics and understand differences in sales performance.

---

## Sales Data Table

![Sales Data Table](sales-data-table.jpeg)

The detailed data table allows users to inspect transaction-level information and analyze individual sales records.

---

# 📈 Dashboard Features

## Sales Overview

The dashboard displays important KPIs such as:

- Total Sales
- Net Sales
- Profit
- Quantity Sold
- Number of Customers
- Number of Products

---

## Product Analysis

The dashboard identifies:

- Top 5 products by sales
- Bottom 5 products by sales
- Top 5 products by profit
- Bottom 5 products by profit
- Top products by quantity sold

This helps management identify both high-performing and underperforming products.

---

## Category Analysis

The dashboard analyzes:

- Sales by category
- Profit by category
- Average discount by category
- Revenue contribution by category

---

## Time-Series Analysis

Sales can be analyzed across:

- Monthly trends
- Quarterly trends
- Annual trends

This helps identify:

- Growth patterns
- Seasonal changes
- Sales fluctuations

---

## Period Comparison

Users can compare:

- Sales
- Profit
- Quantity Sold

between different selected periods.

---

## Regional Analysis

Map-based visualizations help identify regional differences in sales performance.

This can help management understand:

- High-performing regions
- Low-performing regions
- Geographic concentration of sales

---

## Sales vs Profit Analysis

The dashboard analyzes the relationship between sales and profit.

This is useful because:

> High sales do not always guarantee high profitability.

The analysis helps identify products that generate high revenue but comparatively lower profit.

---

# 🔍 Key Insights

## 1. Electronics is the Main Revenue Driver

Electronics generated approximately:

**₹90.11 million in net sales**

This represents roughly:

**75% of total net sales**

This indicates that Electro Hub is highly dependent on the Electronics category.

---

## 2. Total Net Sales

The analyzed dataset represents approximately:

**₹122.31 million in total net sales**

---

## 3. High-Performing Products

Some of the major high-performing products identified during the analysis include:

- Apple MacBook Air
- Apple iPhone 14
- Sony TV
- Samsung Galaxy S21
- HP Pavilion

---

## 4. Revenue Concentration

A relatively small number of products and categories contribute a large percentage of overall revenue.

This helps management identify:

- Core revenue-generating products
- Underperforming products
- Inventory priorities
- Promotion priorities
- Diversification opportunities

---

# 💡 Business Recommendations

## 1. Protect High-Performing Electronics Products

Since Electronics contributes a large portion of revenue:

- Maintain sufficient inventory
- Avoid stock-outs
- Monitor demand closely
- Prioritize high-performing products

---

## 2. Reduce Dependence on Electronics

Heavy dependence on one category creates business risk.

The company can:

- Promote promising products from other categories
- Use targeted discounts
- Run category-specific campaigns
- Improve product diversification

---

## 3. Use Top-N and Bottom-N Analysis

Management can use product rankings to:

- Prioritize strong products
- Review underperforming products
- Improve inventory allocation
- Optimize promotional strategies

---

## 4. Monitor Profit Along with Revenue

Products generating high sales may not always generate high profit.

Business decisions should therefore consider both:

**Revenue + Profitability**

---

## 5. Monitor Sales Trends

Monthly, quarterly, and annual trends can help identify:

- Seasonality
- Growth periods
- Demand fluctuations
- Product performance changes

---

# 📁 Repository Structure

```text
retail-sales-performance-analytics/
│
├── README.md
├── First project power Bi.pbix
├── Store+Data (1).xlsx
├── dashboard-overview.jpeg
├── dashboard-filters.jpeg
├── period-comparison.jpeg
├── sales-comparison.jpeg
├── sales-data-table.jpeg
├── sales-trend-analysis.jpeg
└── top-bottom-5-products.jpeg
```

---

# 🚀 How to Use

1. Clone or download the repository.

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
```

2. Open the `.pbix` file using **Microsoft Power BI Desktop**.

3. If Power BI cannot locate the dataset, update the data source path from:

**Transform Data → Data Source Settings**

4. Refresh the dashboard.

5. Use the available filters and slicers to explore:

- Products
- Categories
- Customers
- Regions
- Sales
- Profit
- Quantity
- Time-based performance

---

# 🎯 Skills Demonstrated

This project demonstrates practical knowledge of:

- Power BI
- Power Query
- DAX
- Data Cleaning
- Data Transformation
- Star Schema
- Fact Tables
- Dimension Tables
- Data Modelling
- KPI Development
- Dashboard Design
- Top-N Analysis
- Bottom-N Analysis
- Time-Series Analysis
- Business Intelligence
- Exploratory Data Analysis
- Business Insight Generation

---

# 📚 What I Learned

Through this project, I strengthened my understanding of:

- Cleaning and transforming raw data
- Building star-schema data models
- Creating relationships between fact and dimension tables
- Developing DAX measures
- Creating business KPIs
- Designing interactive Power BI dashboards
- Performing Top-N and Bottom-N analysis
- Analyzing sales trends over time
- Translating raw data into meaningful business insights
- Presenting analytical findings clearly for decision-making

---

# 🔮 Future Improvements

Possible future improvements include:

- Customer segmentation
- Customer retention analysis
- Repeat-customer analysis
- Profit margin analysis
- Product-level forecasting
- Inventory optimization
- Automated data refresh
- Advanced DAX time-intelligence measures
- Drill-through analysis
- Customer lifetime value analysis

---

# 👤 Author

**Ankur Kumar**

B.Tech  
National Institute of Technology Agartala

---

## ⚠️ Disclaimer

This project is intended for **educational, portfolio, and data analytics demonstration purposes**.
