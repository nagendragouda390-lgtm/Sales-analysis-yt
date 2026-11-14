import pandas as pd

df = pd.read_csv("/storage/8006-15FE/sales_analysis_yt/customer_shopping_behavior.csv")

info = df.info()
describe = df.describe(include="all")

cols = ['customer_id', 'age', 'gender', 'item_purchased', 'category',
        'purchase_amount_(usd)', 'location', 'size', 'color', 'season',    
        'review_rating', 'subscription_status', 'shipping_type', 'discount_applied', 
        'promo_code_used', 'previous_purchases', 'payment_method', 
        'frequency_of_purchases']

df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(" ","_")
df = df.rename(columns={"purchase_amount_(usd)":"amount"})

nulls = df.isna().sum()
# review_rating has 37 null values

# Filling missing values using median

df["review_rating"] = df.groupby("category")["review_rating"].transform(lambda x: x.fillna(x.median()))

age_group = ["young","adult","middle_age","old_age"]

df["age_group"] = pd.qcut(df["age"],q=4,labels = age_group)

df = df.drop(columns={"promo_code_used"})

df.to_csv("/storage/8006-15FE/sales_analysis_yt/data.csv",index=False)






