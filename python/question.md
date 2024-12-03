# Exercise 1: Contact Manager

```
# Create a simple contact manager that uses a dictionary
# Features:
# 1. Add new contact (name, phone, email)
# 2. View all contacts
# 3. Search for contact
# 4. Delete contact
# 5. Exit program

# Example structure:
contacts = {
    "John": {"phone": "1234567890", "email": "john@email.com"},
    "Sarah": {"phone": "9876543210", "email": "sarah@email.com"}
}

# Use functions for each operation
def add_contact():
    # Your code here

def view_contacts():
    # Your code here

def search_contact():
    # Your code here

def delete_contact():
    # Your code here

# Create a menu-driven program
```

Exercise 2: Grade Calculator


```
# Create a program that:
# 1. Takes student scores as input
# 2. Calculates total, average, highest, and lowest scores
# 3. Assigns grades based on average:
#    90-100: A
#    80-89:  B
#    70-79:  C
#    60-69:  D
#    Below 60: F

def calculate_grade(scores):
    # Your code here

def get_statistics(scores):
    # Your code here

# Example usage:
# Enter scores (separated by space): 85 92 78 65 88
# Output:
# Total Score: 408
# Average Score: 81.6
# Highest Score: 92
# Lowest Score: 65
# Grade: B
```

Exercise 3: Word Frequency Counter

```
# Create a program that:
# 1. Takes a text input from user
# 2. Counts frequency of each word
# 3. Ignores case (treat "Hello" and "hello" as same)
# 4. Ignores punctuation
# 5. Displays results sorted by frequency

def count_words(text):
    # Your code here

def display_frequency(word_dict):
    # Your code here

# Example:
# Input: "Hello world. Hello Python, hello programming!"
# Output:
# hello: 3
# world: 1
# python: 1
# programming: 1
```

Exercise 4: Shopping Cart

```
# Create a shopping cart program with these functions:
# 1. Add items (name, price, quantity)
# 2. Remove items
# 3. Update quantities
# 4. View cart
# 5. Calculate total

def add_item(cart, item, price, quantity):
    # Your code here

def remove_item(cart, item):
    # Your code here

def update_quantity(cart, item, quantity):
    # Your code here

def view_cart(cart):
    # Your code here

def calculate_total(cart):
    # Your code here
```

Exercise 5: Bank Account

```
# Create a simple bank account system:
# 1. Create account
# 2. Deposit money
# 3. Withdraw money
# 4. Check balance
# 5. View transaction history

class BankAccount:
    def __init__(self, account_holder, initial_balance=0):
        # Initialize account

    def deposit(self, amount):
        # Add money

    def withdraw(self, amount):
        # Remove money

    def get_balance(self):
        # Return current balance

    def get_transaction_history(self):
        # Return list of transactions
```
