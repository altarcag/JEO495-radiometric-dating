# Rb Sr radiometric dating
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#excel
excel_file = "./sample_2.xlsx"
df = pd.read_excel(excel_file)

# x and y columns in excel
x = df['87Rb/86Sr']
y = df['87Sr/86Sr']

#find line of best fit
m, b = np.polyfit(x, y, 1)

print("slope (m) =", m)

#add points to plot
plt.scatter(x, y)
#add line of best fit to plot
plt.plot(x, m*x+b)  
plt.show()


def age(m):

    l = 10**11 / 1.42
    
    t = np.log(m + 1) * l

    return {
        "t": t,
        "l": l,
    }

result = age(m)
age_val = result["t"]
scientific_format = "{:e}".format(age_val)
print("age (t) =", scientific_format)