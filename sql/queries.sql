--Top 5 funds by aum
SELECT 
    a.fund_house,
    a.aum_crore,
    a.aum_lakh_crore,
    a.num_schemes,
    d.date
FROM fact_aum a
JOIN dim_date d ON d.date_id = a.date_id
ORDER BY d.date DESC, a.aum_crore DESC
LIMIT 5;

--Top 5 performing funds by 3yr return
SELECT 
    f.scheme_name,
    f.fund_house,
    f.category,
    p.return_3yr_pct,
    p.expense_ratio_pct,
    p.return_1yr_pct
FROM fact_performance p
JOIN dim_fund f ON f.fund_id = p.fund_id
ORDER BY p.return_3yr_pct DESC
LIMIT 5;

--Monthly SIP Inflows
WITH monthly_sip AS (
    SELECT 
        d.year,
        d.month,
        SUM(t.amount_inr) AS total_amount
    FROM fact_transactions t
    JOIN dim_date d ON d.date_id = t.date_id
    WHERE t.transaction_type ILIKE '%sip%'
    GROUP BY d.year, d.month
)
SELECT 
    year,
    month,
    ROUND(total_amount::numeric / 10000000, 2) AS total_sip_crore,
    CASE 
        WHEN LAG(total_amount) OVER (ORDER BY year, month) = 0 
          OR LAG(total_amount) OVER (ORDER BY year, month) IS NULL 
        THEN NULL
        ELSE ROUND(
            CAST(100.0 * (total_amount - LAG(total_amount) OVER (ORDER BY year, month)) 
                 / LAG(total_amount) OVER (ORDER BY year, month) AS numeric), 
        2)
    END AS yoy_growth_pct
FROM monthly_sip
ORDER BY year DESC, month DESC
LIMIT 24;

--Average NAV Performance by Category (Last 1 Year)
SELECT 
    f.category,
    COUNT(DISTINCT f.fund_id) AS num_funds,
    AVG(p.return_1yr_pct) AS avg_1yr_return,
    AVG(p.expense_ratio_pct) AS avg_expense_ratio
FROM fact_performance p
JOIN dim_fund f ON f.fund_id = p.fund_id
GROUP BY f.category
ORDER BY avg_1yr_return DESC;

--Funds with Low Expense Ratio (< 1%) and Good 3Y Returns (>12%)
SELECT 
    f.scheme_name,
    f.fund_house,
    f.category,
    p.return_3yr_pct,
    p.expense_ratio_pct
FROM fact_performance p
JOIN dim_fund f ON f.fund_id = p.fund_id
WHERE p.expense_ratio_pct < 1.0 
  AND p.return_3yr_pct > 12
ORDER BY p.return_3yr_pct DESC;

--State-wise Transaction Volume (Top 10 States)
SELECT 
    t.state,
    COUNT(*) AS total_transactions,
    SUM(t.amount_inr)/10000000 AS total_amount_crore,
    COUNT(CASE WHEN t.transaction_type = 'SIP' THEN 1 END) AS sip_transactions
FROM fact_transactions t
GROUP BY t.state
ORDER BY total_amount_crore DESC
LIMIT 10;

--NAV Growth for Top Funds (Last 30 days approx)
SELECT
    f.scheme_name,
    MAX(CASE WHEN d.date = (SELECT MAX(date) FROM dim_date) THEN n.nav END) AS latest_nav,
    MIN(CASE WHEN d.date >= (SELECT MAX(date) FROM dim_date) - INTERVAL '30 days'
             THEN n.nav END) AS nav_30_days_ago,
    ROUND(
        CAST(100.0 * (MAX(n.nav) - MIN(n.nav)) / NULLIF(MIN(n.nav), 0) AS numeric), 
    2) AS nav_growth_30d_pct
FROM fact_nav n
JOIN dim_fund f ON f.fund_id = n.fund_id
JOIN dim_date d ON d.date_id = n.date_id
WHERE f.scheme_name IN (
    SELECT f2.scheme_name 
    FROM dim_fund f2
    JOIN fact_aum a ON f2.fund_house = a.fund_house
    GROUP BY f2.scheme_name, a.aum_crore
    ORDER BY a.aum_crore DESC 
    LIMIT 5
)
GROUP BY f.scheme_name
HAVING MAX(n.nav) IS NOT NULL
ORDER BY nav_growth_30d_pct DESC;

--AUM Growth by Fund House (Latest vs Previous Quarter)
WITH latest AS (
    SELECT 
        a.fund_house,
        a.aum_crore,
        d.date,
        ROW_NUMBER() OVER (PARTITION BY a.fund_house ORDER BY d.date DESC) as rn
    FROM fact_aum a
    JOIN dim_date d ON d.date_id = a.date_id
)
SELECT 
    curr.fund_house,
    curr.aum_crore AS current_aum_crore,
    prev.aum_crore AS previous_aum_crore,
    ROUND(
        CAST(100.0 * (curr.aum_crore - prev.aum_crore) / NULLIF(prev.aum_crore, 0) AS numeric), 
    2) AS growth_pct
FROM latest curr
LEFT JOIN latest prev 
    ON prev.fund_house = curr.fund_house 
   AND prev.rn = curr.rn + 1
WHERE curr.rn = 1
ORDER BY growth_pct DESC;

--Risk-Adjusted Performance
SELECT 
    f.category,
    AVG(p.return_3yr_pct) AS avg_return_3y,
    AVG(p.expense_ratio_pct) AS avg_expense,
    COUNT(*) AS fund_count
FROM fact_performance p
JOIN dim_fund f ON f.fund_id = p.fund_id
GROUP BY f.category
HAVING AVG(p.return_3yr_pct) > 10
ORDER BY avg_return_3y DESC;

--Investor Transaction Summary by Age/Gender
SELECT 
    t.transaction_type,
    COUNT(*) AS count,
    SUM(t.amount_inr) AS total_amount,
    AVG(t.amount_inr) AS avg_ticket_size
FROM fact_transactions t
GROUP BY t.transaction_type
ORDER BY total_amount DESC;