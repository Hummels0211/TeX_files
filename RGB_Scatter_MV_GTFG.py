import numpy as np
import plotly
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D # Import the tool supporting 3D
import csv

# Load csv file as dataframe, replace the path before use
ds = pd.read_csv("C:\Users\giaccoyu\Desktop\Photos\Seedlings\Yao-Min's Project\RGB_MV_GTFG.csv")

# Set the categories

colours = { "MV10$\\mu$M": '#FFB6C1', "MV10$\\mu$M & GTFG10$\\mu$M": '#F08080', "MV10$\\mu$M & GTFG50$\\mu$M": '#DC143C',
            "MV2$\\mu$M": '#98FB98', "MV2$\\mu$M & GTFG10$\\mu$M": '#32CD32', "MV2$\\mu$M & GTFG50$\\mu$M": '#008000',
            "MV1$\\mu$M": '#B0E0E6', "MV1$\\mu$M & GTFG10$\\mu$M": '#48D1CC', "MV1$\\mu$M & GTFG50$\\mu$M": '#008080',
            "MV0.5$\\mu$M": '#F5DEB3', "MV0.5$\\mu$M & GTFG10$\\mu$M": '#F4A460', "MV0.5$\\mu$M & GTFG50$\\mu$M": '#A0522D'}
# shapes = {} # Set the shape of different treatment
# Build x,y,z scale


fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

for ind,group in ds.groupby('Treatment'):
    ax.scatter(group['\tR'], group['\tG'],group['\tB'], label = ind, c = colours[ind], alpha=0.7)
    ax.legend()

ax.margins(0.05)

# In the original csv file, every label starts from a TAB
ax.set_xlabel('R')
ax.set_ylabel('G')
ax.set_zlabel('B')
ax.legend(loc='upper left', numpoints=1, ncol=4, fontsize=6, bbox_to_anchor=(0, 0))
plt.title('RGB colour analysis of MV & GTFG seedling treatment')
plt.show()
