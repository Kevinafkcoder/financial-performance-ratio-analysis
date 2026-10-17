import pandas as pd

df=pd.read_csv("data/financial_data.csv")

#cleaning
print("Rows:", len(df))
print("Duplicate rows:", df.duplicated().sum())
print("Missing values:")
print(df.isnull().sum())

df["year"] = df["year"].astype(int)
df = df.drop_duplicates()


# Financial metrics
df["gross_profit"] = df["revenue"] - df["cost_of_goods_sold"]

df["profit_margin"] = (
    df["net_income"] / df["revenue"] * 100
)

df["roa"] = (
    df["net_income"] / df["total_assets"] * 100
)

df["roe"] = (
    df["net_income"] / df["shareholders_equity"] * 100
)

df["current_ratio"] = (
    df["current_assets"] / df["current_liabilities"]
)

df["debt_to_equity"] = (
    df["total_debt"] / df["shareholders_equity"]
)

# Year-over-year revenue growth
df = df.sort_values(["company", "year"])

df["revenue_growth"] = (
    df.groupby("company")["revenue"].pct_change() * 100
)

df.to_csv("data/financial_metrics.csv", index=False) 

print("\nProcessed financial metrics:")
print(df.round(2).to_string(index=False))

