# 5. Visualize the borrower data

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine

# Define your database connection URL
DATABASE_URL = 'your_database_connection_string'

# Create an engine and connect to the database
engine = create_engine(DATABASE_URL)
query = 'SELECT * FROM your_table_name'
df = pd.read_sql(query, engine)

# Set up the visualizations
plt.figure(figsize=(15, 10))

# Age Distribution
plt.subplot(2, 3, 1)
sns.histplot(df['Age'], bins=20, kde=True)
plt.title('Age Distribution')

# Gender Distribution
plt.subplot(2, 3, 2)
sns.countplot(data=df, x='Gender')
plt.title('Gender Distribution')

# Marital Status Distribution
plt.subplot(2, 3, 3)
sns.countplot(data=df, x='Marital Status')
plt.title('Marital Status Distribution')

# Language Preference Distribution
plt.subplot(2, 3, 4)
sns.countplot(data=df, x='Language Preference')
plt.title('Language Preference Distribution')

# Loan Type Distribution
plt.subplot(2, 3, 5)
sns.countplot(data=df, x='Loan Type')
plt.title('Loan Type Distribution')

# Credit Score Distribution
plt.subplot(2, 3, 6)
sns.histplot(df['Credit Score'], bins=20, kde=True)
plt.title('Credit Score Distribution')

plt.tight_layout()
plt.show()
