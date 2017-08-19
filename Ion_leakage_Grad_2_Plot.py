import numpy as np
import scipy as sp
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import csv

# Load the data set from the csv file and create the dataframe
ds = pd.read_csv("C:\Users\giaccoyu\Desktop\TeXWorks\Fig\Result\Ion_leakage_Result_0_3_15.csv")

# Create a 2 * 2 plot frame
fig = plt.figure()


# Plotting in different subplot
ax1 = fig.add_subplot(2,2,1)
plt.plot(ds['0-I'],'x-')
plt.plot(ds['3-I'],'D-')
plt.plot(ds['6-I'],'o-')
plt.plot(ds['9-I'],'s-')
plt.plot(ds['12-I'],'^-')
plt.plot(ds['15-I'],'.-')
plt.ylim((20,250))
plt.title('Sample I')

ax2 = fig.add_subplot(2,2,2)
plt.plot(ds['0-II'],'x-')
plt.plot(ds['3-II'],'D-')
plt.plot(ds['6-II'],'o-')
plt.plot(ds['9-II'],'s-')
plt.plot(ds['12-II'],'^-')
plt.plot(ds['15-II'],'.-')
plt.ylim((20,250))
plt.title('Sample II')

ax3 = fig.add_subplot(2,2,3)
plt.plot(ds['0-III'],'x-')
plt.plot(ds['3-III'],'D-')
plt.plot(ds['6-III'],'o-')
plt.plot(ds['9-III'],'s-')
plt.plot(ds['12-III'],'^-')
plt.plot(ds['15-III'],'.-')
plt.ylim((20,250))
plt.title('Sample III')

legend = ['Con','3$\\mu$g/mL','6$\\mu$g/mL','9$\\mu$g/mL','12$\\mu$g/mL','15$\\mu$g/mL']
plt.legend(legend,bbox_to_anchor=(2, 0.8), fontsize = 10)

fig.text(0.03, 0.5, 'Electrical Conductivity ($\\mu$S/cm)', fontsize = 20, ha='center', va='center', rotation='vertical')
fig.text(0.5,0.03,'Days', fontsize = 20, ha = 'center', va = 'center', rotation = 'horizontal')
plt.show()