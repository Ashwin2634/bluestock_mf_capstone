
## Installation

Follow these steps to get the project up and running:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git](https://github.com/Ashwin2634/Capstone-Project-I---Mutual-Fund-Analytics.git
   cd your-repo-name
2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
3. Run the main scripts:
   ```bash
   python notebook/data_ingestion.py
   python notebook/live_nav_fetch.py
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

bluestock_mf_capstone/
├── data/                  # Raw and processed datasets
├── notebooks/             # Jupyter notebooks for EDA & analysis
│   ├── 01_data_ingestion.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_eda_analysis.ipynb
│   ├── 04_performance_analytics.ipynb
│   └── 05_advanced_analytics.ipynb
├── scripts/               # Production Python scripts
├── src/                   # Source data & project documents
├── reports/               # Generated reports & newsletters
├── dashboard/             # Power BI or other dashboard files
├── sql/                   # SQL queries and schema
├── processed/             # Cleaned & enriched datasets (generated)
├── db/                    # SQLite database (generated)
├── streamlit_app.py       # Interactive Streamlit dashboard
├── run_pipeline.py        # Main orchestration script
├── email_report.py        # Automated newsletter generator
├── requirements.txt
├── data_dictionory.md     # Complete data dictionary
└── README.md


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
