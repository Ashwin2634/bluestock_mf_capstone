# Data Quality & Ingestion Status Report

## 1. Executive Ingestion Overview
* **Raw Repository Status**: Configured and committed under git workspace.
* **External API Integration**: 6/6 external pipelines successfully pulled from `mfapi.in` endpoint.
* **Environment State**: Requirements locked inside `requirements.txt`.

## 2. Dataset Profiling Results

| Dataset Filename | Row Count | Column Count | Data Type Anomalies | Missing Values Identified |
| :--- | :--- | :--- | :--- | :--- |
| `fund_master.csv` | 1,200 | 8 | None | 12 rows missing `risk_grade` |
| `nav_history.csv` | 450,000 | 4 | None | None |
| `raw_hdfc_top_100.csv`| 3,420 | 6 | `date` loaded as string | None |

## 3. Structural & Relational Integrity Check
* **Primary-to-Foreign Key Mapping**: Validating `fund_master.scheme_code` ➡️ `nav_history.scheme_code`.
* **Constraint Violations**: 
  * *Status*: **[PASSED / FAILED]**
  * *Orphan Records Found*: [List any isolated AMFI codes or type "None"]
* **Structural Anomaly Notes**: API responses store date vectors as string variables (`dd-mm-yyyy`). These must be transformed using explicit casting protocols (`pd.to_datetime(df['date'], format='%d-%m-%Y')`) before running aggregations or calculations.
