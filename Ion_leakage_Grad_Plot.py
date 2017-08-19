import numpy as np
import scipy as sp
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import csv

# Load the data set from the csv file and create the dataframe
ds = pd.read_csv("C:\Users\giaccoyu\Desktop\TeXWorks\Fig\Result\Ion_leakage_Result_0.15_15.csv")

# Create a 3 * 2 plot frame
fig, axes = plt.subplots(nrows=3, ncols=2)

# Plotting in different subplot
ds['\tCon-I'].plot(ax=axes[0,0], marker='o')
ds['\t0.15-I'].plot(ax=axes[0,0], marker='x')
ds['\t1.5-I'].plot(ax=axes[0,0], marker='D')
ds['\t15-I'].plot(ax=axes[0,0],marker='s')
axes[0,0].set_title('Sample I')
axes[0,0].set_ylim((20,160))

ds['\tCon-II'].plot(ax=axes[0,1],marker='o')
ds['\t0.15-II'].plot(ax=axes[0,1],marker='x')
ds['\t1.5-II'].plot(ax=axes[0,1],marker='D')
ds['\t15-II'].plot(ax=axes[0,1],marker='s')
axes[0,1].set_title('Sample II')
axes[0,1].set_ylim((20,160))

ds['\tCon-III'].plot(ax=axes[1,0],marker='o')
ds['\t0.15-III'].plot(ax=axes[1,0],marker='x')
ds['\t1.5-III'].plot(ax=axes[1,0],marker='D')
ds['\t15-III'].plot(ax=axes[1,0],marker='s')
axes[1,0].set_title('Sample III')
axes[1,0].set_ylim((20,160))
axes[1,0].set_ylabel('Electrical Conductivity ($\\mu$S/cm)', fontsize=20)

ds['\tCon-IV'].plot(ax=axes[1,1],marker='o')
ds['\t0.15-IV'].plot(ax=axes[1,1],marker='x')
ds['\t1.5-IV'].plot(ax=axes[1,1],marker='D')
ds['\t15-IV'].plot(ax=axes[1,1],marker='s')
axes[1,1].set_title('Sample IV')
axes[1,1].set_ylim((20,160))

ds['\tCon-V'].plot(ax=axes[2,0],marker='o')
ds['\t0.15-V'].plot(ax=axes[2,0],marker='x')
ds['\t1.5-V'].plot(ax=axes[2,0],marker='D')
ds['\t15-V'].plot(ax=axes[2,0],marker='s')
axes[2,0].set_title('Sample V')
axes[2,0].set_ylim((20,160))
axes[2,0].set_xlabel('Days', fontsize =18)

ds['\tCon-VI'].plot(ax=axes[2,1],marker='o')
ds['\t0.15-VI'].plot(ax=axes[2,1],marker='x')
ds['\t1.5-VI'].plot(ax=axes[2,1],marker='D')
ds['\t15-VI'].plot(ax=axes[2,1],marker='s')
axes[2,1].set_title('Sample VI')
axes[2,1].set_ylim((20,160))
axes[2,1].set_xlabel('Days', fontsize = 18)

legend = ['Con','0.15$\\mu$g/mL','1.5$\\mu$g/mL','15$\\mu$g/mL']

# Set the legend of the plot
plt.legend(legend,bbox_to_anchor=(1, 0.5), fontsize = 7)



plt.show(fig)


