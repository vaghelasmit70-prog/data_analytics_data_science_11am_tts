# What Is Python?

**Python** is a high-level, general-purpose programming language known for readable syntax and a large collection of libraries. It is widely used for automation, web development, artificial intelligence, and data analytics.

## Role of Python in Data Analytics

Python supports the full analytics workflow:

1. **Data collection:** Read files, databases, APIs, and permitted web sources.
2. **Data cleaning:** Handle missing values, duplicates, incorrect types, and inconsistent text.
3. **Data transformation:** Filter, join, group, reshape, and calculate fields.
4. **Exploratory analysis:** Find patterns, distributions, relationships, and outliers.
5. **Visualization:** Create charts and reports.
6. **Statistics and machine learning:** Build models and evaluate predictions.
7. **Automation:** Schedule repeatable reports and data pipelines.

## Important Python Libraries

- **NumPy:** Numerical arrays and mathematical operations.
- **pandas:** Tables, data cleaning, grouping, and file import/export.
- **Matplotlib:** Basic charts and plotting.
- **Seaborn:** Statistical visualizations.
- **Plotly:** Interactive charts and dashboards.
- **SciPy:** Scientific and statistical computing.
- **scikit-learn:** Machine-learning algorithms and evaluation.
- **Requests:** HTTP requests to web services and APIs.

## Simple Analytics Example

```python
import pandas as pd

sales = pd.read_csv("sales.csv")
summary = sales.groupby("region", as_index=False)["revenue"].sum()
print(summary)
```

This example reads a CSV file, groups records by region, and calculates total revenue for each region.

## Best Practices

Use meaningful names, keep code in small steps, document assumptions, validate results, protect credentials, use virtual environments, and save cleaned data separately from raw data.

## Conclusion

Python is a flexible and powerful tool for data analytics because it combines readable programming with libraries for data preparation, visualization, statistics, machine learning, and automation.
