import numpy as np

# Creating a 1D array
arr1 = np.array([1, 2, 3, 4, 5])
print("1D Array:", arr1)

# Creating a 2D array
arr2 = np.array([[1, 2, 3], [4, 5, 6]])
print("2D Array:\n", arr2)

# Array of zeros
zeros_arr = np.zeros((2, 3))
print("Zeros Array:\n", zeros_arr)

# Array of ones
ones_arr = np.ones((3, 2))
print("Ones Array:\n", ones_arr)

# Array with a range of values
range_arr = np.arange(0, 10, 2)
print("Range Array:", range_arr)

# Reshaping an array
reshaped_arr = arr1.reshape((5,1))
print("Reshaped Array:\n", reshaped_arr)

# Basic arithmetic operations
arr3 = np.array([1, 2, 3])
arr4 = np.array([4, 5, 6])
sum_arr = arr3 + arr4
print("Sum of arrays:", sum_arr)
mult_arr = arr3 * arr4
print("Multiplication of arrays:", mult_arr)

# Statistical operations
mean_val = np.mean(arr1)
print("Mean:", mean_val)
max_val = np.max(arr1)
print("Max:", max_val)

# Dot product
dot_product = np.dot(arr3, arr4)
print("Dot product:", dot_product)