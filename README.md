
-------------------------------------------------------------------------------------------------------------------------------------

# Bluestock Mutual Fund Analytics Platform

**A comprehensive Mutual Fund Analytics & Insights Platform** built as a Capstone Project for **Bluestock Fintech Pvt. Ltd.**

---

## 📊 Project Overview

This project delivers an end-to-end **Mutual Fund Analytics Platform** focused on the Indian Mutual Fund industry. It combines data engineering, advanced analytics, risk modeling, interactive visualization, and automated reporting to provide deep insights for investors, advisors, and fund houses.

### Key Features

- **Data Pipeline**: Automated ingestion, cleaning, and loading of AMFI, NSE, and proprietary datasets
- **Performance Analytics**: Risk-adjusted metrics, alpha/beta, Sharpe, Sortino, drawdowns, and fund scorecards
- **Investor Behavior Analytics**: Transaction patterns, SIP trends, demographic insights
- **Portfolio & Risk Modeling**: VaR, CVaR, Monte Carlo simulations, Efficient Frontier, HHI concentration analysis
- **Interactive Dashboards**: Streamlit web app (alternative to Power BI)
- **Automated Reporting**: Weekly HTML newsletter generation and email delivery

---

## 🗂️ Repository Structure

```bash
bluestock_mf_capstone/
├── data/                    # Raw and processed datasets
├── notebooks/               # Jupyter notebooks for EDA & analysis
│   ├── 01_data_ingestion.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_eda_analysis.ipynb
│   ├── 04_performance_analytics.ipynb
│   └── 05_advanced_analytics.ipynb
├── scripts/                 # Production Python scripts
├── src/                     # Source code & project documents
├── reports/                 # Generated reports & newsletters
├── dashboard/               # Power BI or other dashboard files
├── sql/                     # SQL queries and schema
├── processed/               # Cleaned & enriched datasets (generated)
├── db/                      # SQLite database (generated)
├── streamlit_app.py         # Interactive Streamlit dashboard
├── run_pipeline.py          # Main orchestration script
├── email_report.py          # Automated newsletter generator
├── requirements.txt
├── data_dictionary.md       # Complete data dictionary
└── README.md
```



---

## 🚀 Installation & Setup

### Prerequisites
- Python 3.9+
- Git

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ashwin2634/bluestock_mf_capstone.git
   cd bluestock_mf_capstone
2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
3. Run the main scripts:
   ```bash
   python run_pipeline.py
This will:
- Ingest and clean data
- Create SQLite database
- Compute all performance metrics
- Run advanced analytics
- Generate reports
4. Launch the Streamlit Dashboard
   ```bash
   streamlit run streamlit_app.py

## 📈What You Can Explore
**Industry Overview**

- Total AUM trends
- SIP inflows and folio growth
- Market share by fund houses

## Fund Performance

- Return vs Risk scatter plots
- Fund scorecards (0–100)
- NAV history vs benchmarks
- Risk metrics (Sharpe, Sortino, Max Drawdown)

## Investor Analytics

- Transaction patterns by demographics
- City-tier and state-wise insights
- Behavioral segmentation

## SIP & Market Trends

- Monthly SIP inflows
- Category-wise flows
- Benchmark comparisons


## 🛠️ Tech Stack

- **Language**: Python
- **Data Processing**: Pandas, NumPy
- **Visualization**: Plotly, Streamlit
- **Database**: SQLite
- **Notebooks**: Jupyter
- **Reporting**: HTML + Email automation
- **Advanced Analytics**: SciPy, statsmodels, Monte Carlo simulations


## 📚 Data Sources

- AMFI India
- mfapi.in
- NSE India / BSE India
- Bluestock Fintech Capstone Dataset
 
Data Period: January 2022 – May 2026

## 📄 Documentation
 
- Data Dictionary — Detailed schema of all datasets
- Notebooks in /notebooks/ folder for methodology and analysis
- Project report available in /src/


## 🎯 Purpose
This capstone project demonstrates real-world application of data engineering, financial analytics, and full-stack data science skills in the Indian Mutual Fund industry.

## 👤 Author
Ashwin Prajapati
Intern, Bluestock Fintech Pvt. Ltd. (Cohort 2026)

## 📄 License

Copyright © 2026 Bluestock Fintech Pvt. Ltd. All rights reserved.

This is an internship project. All intellectual property rights belong to **Bluestock Fintech Pvt. Ltd.**  
No part of this project may be reproduced or distributed without prior written permission.
