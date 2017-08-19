import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import csv
p1 = open("C:\Users\giaccoyu\Desktop\Photos\Seedlings\Yao-Min's Project\MV_GTFG_1.csv")
p2 = open("C:\Users\giaccoyu\Desktop\Photos\Seedlings\Yao-Min's Project\MV_GTFG_2.csv")

HighMV = csv.reader(p1)
LowMV = csv.reader(p2)

MV10 = []
MV10_GTFG10 = []
MV10_GTFG50 = []
MV2 = []
MV2_GTFG10 = []
MV2_GTFG50 = []

#Fill the array of each treatment

for row in HighMV:
    MV10.append(row[5])
    MV10_GTFG10.append(row[10])
    MV10_GTFG50.append(row[15])
    MV2.append(row[20])
    MV2_GTFG10.append(row[25])
    MV2_GTFG50.append(row[30])

MV1 = []
MV1_GTFG10 = []
MV1_GTFG50 = []
# Collecting the data of MV 0.5$\mu$M treatment
MVhalf = []
MVhalf_GTFG10 = []
MVhalf_GTFG50 = []

for row in LowMV:
    MV1.append(row[5])
    MV1_GTFG10.append(row[10])
    MV1_GTFG50.append(row[15])
    MVhalf.append(row[20])
    MVhalf_GTFG10.append(row[25])
    MVhalf_GTFG50.append(row[30])


# Remove the first two elements in the array
MV10 = MV10[2:]
MV10_GTFG10 = MV10_GTFG10[2:]
MV10_GTFG50 = MV10_GTFG50[2:]
MV2 = MV2[2:]
MV2_GTFG10 = MV2_GTFG10[2:]
MV2_GTFG50 = MV2_GTFG50[2:]
MV1 = MV1[2:]
MV1_GTFG10 = MV1_GTFG10[2:]
MV1_GTFG50 = MV1_GTFG50[2:]
MVhalf = MVhalf[2:]
MVhalf_GTFG10 = MVhalf_GTFG10[2:]
MVhalf_GTFG50 = MVhalf_GTFG50[2:]

# Convert the type of the element from string to float
MV10 = map(float, MV10)
MV10_GTFG10 = map(float, MV10_GTFG10)
MV10_GTFG50 = map(float, MV10_GTFG50)
MV2 = map(float, MV2)
MV2_GTFG10 = map(float, MV2_GTFG10)
MV2_GTFG50 = map(float, MV2_GTFG50)
MV1 = map(float, MV1)
MV1_GTFG10 = map(float, MV1_GTFG10)
MV1_GTFG50 = map(float, MV1_GTFG50)
MVhalf = map(float, MVhalf)
MVhalf_GTFG10 = map(float, MVhalf_GTFG10)
MVhalf_GTFG50 = map(float, MVhalf_GTFG50)

# Change all the lists into arrays
MV10 = np.asarray(MV10)
MV10_GTFG10 = np.asarray(MV10_GTFG10)
MV10_GTFG50 = np.asarray(MV10_GTFG50)
MV2 = np.asarray(MV2)
MV2_GTFG10 = np.asarray(MV2_GTFG10)
MV2_GTFG50 = np.asarray(MV2_GTFG50)
MV1 = np.asarray(MV1)
MV1_GTFG10 = np.asarray(MV1_GTFG10)
MV1_GTFG50 = np.asarray(MV1_GTFG50)
MVhalf = np.asarray(MVhalf)
MVhalf_GTFG10 = np.asarray(MVhalf_GTFG10)
MVhalf_GTFG50 = np.asarray(MVhalf_GTFG50)

# Create a data set of all the treatments
MV_data = np.array([MV10, MV10_GTFG10, MV10_GTFG50, MV2, MV2_GTFG10,
                    MV2_GTFG50, #MV1, MV1_GTFG10, MV1_GTFG50,
                    MVhalf, MVhalf_GTFG10, MVhalf_GTFG50])

# Transpose the matrix
MV_data = np.transpose(MV_data)

# Result_Dat = pd.DataFrame()
df = pd.DataFrame(MV_data, columns=['MV10$\\mu$M', 'MV10$\\mu$M \n & \n GTFG10$\\mu$M', 'MV10$\\mu$M \n & \n GTFG50$\\mu$M',
                                    'MV2$\\mu$M', 'MV2$\\mu$M \n & \n GTFG10$\\mu$M', 'MV2$\\mu$M \n & \n GTFG50$\\mu$M',
                                    #'MV1$\\mu$M', 'MV1$\\mu$M \n & \n GTFG10$\\mu$M', 'MV1$\\mu$M \n & \n GTFG50$\\mu$M',
                                    'MV0.5$\\mu$M', 'MV0.5$\\mu$M \n & \n GTFG10$\\mu$M', 'MV0.5$\\mu$M \n & \n GTFG50$\\mu$M'])



# Setting a 2-D X-Y scale
sns.set(font_scale=.5)
fig = sns.stripplot(data=df,jitter=True)
fig.set_xlabel('Treatment', fontsize=15)
fig.set_ylabel('Elongation Ratio', fontsize=15)
fig.axes.set_title('Seedling elongation under different MV and GTFG treatment', fontsize=20)

#print df #MV10_GTFG10, MV10_GTFG50, MV2, MV2_GTFG10, MV2_GTFG50

sns.plt.show(fig)

