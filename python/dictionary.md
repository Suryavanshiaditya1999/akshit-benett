
Add and update Dictionary

```
# Original dictionary
city_population = {
    "New York": 8419000,
    "Los Angeles": 3980000,
    "Chicago": 2716000
}

# Add a new city
city_population["Houston"] = 2328000

# Update the population of Chicago
city_population["Chicago"] = 2700000

print("Updated city populations:", city_population)

```

Check if a Key Exists in a Dictionary

```
# Dictionary
city_population = {
    "New York": 8419000,
    "Los Angeles": 3980000,
    "Chicago": 2716000
}

# Check if "Miami" is in the dictionary
if "Miami" in city_population:
    print("Miami is in the dictionary.")
else:
    print("Miami is not in the dictionary.")

```

Question: Create a Dictionary and Access an Element

```
# Create a dictionary
city_population = {
    "New York": 8419000,
    "Los Angeles": 3980000,
    "Chicago": 2716000
}

# Access and print the population of Los Angeles
print("Population of Los Angeles:", city_population["Los Angeles"])

```

Iterating Through a Dictionary:

```
for key, value in my_dict.items():
    print(f"{key}: {value}")
```

Checking if Key Exist

```
if "key1" in my_dict:
    print("Key exists!")
```

Count occurence of element:

```
# List of colors
colors = ["red", "blue", "red", "green", "blue", "blue"]

# Dictionary to count occurrences
color_count = {}

for color in colors:
    if color in color_count:
        color_count[color] += 1
    else:
        color_count[color] = 1

print("Color count:", color_count)

```

Remove an Element from a Dictionary

```
# Dictionary of products
products = {
    "Apple": 0.5,
    "Banana": 0.3,
    "Orange": 0.7
}

# Remove "Orange"
products.pop("Orange")

print("Updated products:", products)
```

Find the Maximum Value in a Dictionary

```
# Dictionary of test scores
test_scores = {
    "Alice": 88,
    "Bob": 92,
    "Charlie": 85
}

# Find the student with the highest score
top_student = max(test_scores, key=test_scores.get)

print("Student with the highest score:", top_student)
```

 Merge Two Dictionaries

```
# Dictionaries of stock prices
stocks_1 = {
    "AAPL": 150,
    "MSFT": 280
}
stocks_2 = {
    "GOOGL": 2700,
    "AAPL": 155  # Duplicate key
}

# Merge dictionaries
merged_stocks = {**stocks_1, **stocks_2}

print("Merged stocks:", merged_stocks)
```
