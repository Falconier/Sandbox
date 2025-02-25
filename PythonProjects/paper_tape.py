import numpy as np
import pandas as pd
import matlib as ml

# b = np.array([[1.0,2.0,3.0],[3.0,4.0,5.0]])
# print(b)
# b[2,:] = 20.0
# print(b)

# a = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])

# print(np.full_like(a, 100))

# output = np.zeros((7, 7))

# z = np.ones((5, 5))
# z[2,2] = 5

# output[1:-1, 1:-1] = z
# print(output)

# a = np.array([1, 2, 3, 4, 5])
# b = a
# b[2] = 20
# print(a)
# print(b)

# a = np.array(([1, 2, 3, 4, 5], [6, 7, 8, 9, 10]))
# b = np.max(a, axis=1).sum()
# print(b)
# print(a)

a = np.ones((2, 4))
b = a.reshape((4, 2))
print(b)