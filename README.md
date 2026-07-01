# CLV and Inventory Risk Pipeline

**CLV and Inventory Risk Pipeline** is an end-to-end data analytics project that analyzes customer purchasing behavior, estimates Customer Lifetime Value (CLV), identifies inventory risk, and visualizes key business metrics using SQL Server, Python, and Power BI. The project demonstrates a complete analytics workflow—from data cleaning and exploratory analysis to SQL-based business reporting and interactive dashboards—using a real-world e-commerce dataset.

---

## Prerequisites

* SQL Server (SSMS)
* Python 3.10 or later
* Jupyter Notebook
* Power BI Desktop
* Git (optional)

---

## Project Workflow

1. Import the raw datasets into SQL Server.
2. Execute the database schema creation script.
3. Run SQL queries to generate business insights and KPIs.
4. Perform data cleaning and exploratory data analysis using Python.
5. Build Customer Lifetime Value (CLV) analysis.
6. Connect SQL Server to Power BI.
7. Refresh the dataset and explore the interactive dashboards.

---

## Repository Structure

```
CLV-and-Inventory-Risk-Pipeline/
│
├── README.md
│   └── Executive summary, project overview, setup instructions, and documentation.
│
├── data/
│   └── Data dictionary, sample datasets, and dataset references.
│
├── sql_scripts/
│   ├── 01_schema_setup.sql
│   │   └── Database schema creation, table definitions, and relationships.
│   │
│   └── 02_business_queries.sql
│       └── Business SQL queries for KPIs, reporting, and analysis.
│
├── python_notebooks/
│   ├── 01_data_cleaning_eda.ipynb
│   │   └── Data preprocessing, cleaning, and exploratory data analysis.
│   │
│   └── 02_clv_statistical_modeling.ipynb
│       └── Customer Lifetime Value (CLV) modeling and statistical analysis.
│
└── powerbi_dashboard/
    ├── executive_insights.pbix
    │   └── Interactive Power BI dashboard.
    │
    └── dashboard_screenshot.png
        └── Dashboard preview image.
```

---

## Project Architecture

```
Raw E-commerce Dataset
          │
          ▼
SQL Server Database
          │
          ├── Database Schema
          ├── Data Cleaning
          └── Business Queries
          │
          ▼
Python Analysis
          ├── Data Cleaning & EDA
          └── CLV Statistical Modeling
          │
          ▼
Power BI Dashboard
          ├── Executive Dashboard
          ├── Inventory Risk Dashboard
          └── Sales Performance Dashboard
```

---

## Dashboard Pages

### Executive Dashboard

Provides a high-level overview of business performance through key performance indicators and trend analysis.

**Key Metrics**

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value
* Customer Lifetime Value (CLV)

---

### Inventory Risk Dashboard

Monitors inventory health and operational efficiency across product categories.

**Key Metrics**

* Inventory Risk Score
* Products at Risk
* Average Delivery Time
* Delayed Deliveries

---

### Sales Performance Dashboard

Analyzes sales trends, customer satisfaction, and product performance over time.

**Key Metrics**

* Monthly Revenue
* Monthly Orders
* Average Delivery Days
* Review Score Distribution

---

## Features

* Relational database design using SQL Server
* Data cleaning and preprocessing with Python
* Exploratory Data Analysis (EDA)
* Customer Lifetime Value (CLV) analysis
* Business KPI generation using SQL
* Inventory risk assessment
* Interactive Power BI dashboards
* Executive-level business reporting
* Modular project organization with clear documentation

---

## Technologies Used

* SQL Server (SSMS)
* SQL
* Python
* Pandas
* NumPy
* Jupyter Notebook
* Power BI
* DAX
* Git & GitHub

---

## Business Insights Generated

* Identifies high-value customers based on Customer Lifetime Value.
* Tracks monthly sales performance and revenue trends.
* Detects inventory categories with elevated business risk.
* Evaluates delivery performance and fulfillment efficiency.
* Analyzes customer purchasing behavior and satisfaction.
* Provides executive dashboards for data-driven decision-making.

---

## Future Enhancements

* Machine Learning-based CLV prediction
* Inventory demand forecasting
* Customer segmentation using clustering algorithms
* Automated ETL pipeline
* Real-time dashboard refresh
* Cloud deployment using Azure SQL and Power BI Service

---

## Author

**Khushi Golecha**

Aspiring Data Analyst

**Skills:** SQL • Python • Power BI • Excel • Data Visualization • Business Intelligence

GitHub: https://github.com/khushi-golecha

---

## License

This project is intended for educational and portfolio purposes.

