import matplotlib.pyplot as plt
import matplotlib.spines as sp
import numpy as np
from PIL import Image
from pylab import *
import os
from os import listdir
from os.path import isfile, join
# Change the reading directory path to the photo folder
os.chdir("C:/Users/giaccoyu/Desktop/Photos/Protoplast-20170817T144832Z-001/Protoplast")
os.getcwd()
# Collect all the file in a new array called 'Allfiles':
Allfiles = [f for f in listdir('C:\Users\giaccoyu\Desktop\Photos\Protoplast-20170817T144832Z-001\Protoplast')
             if isfile(join('C:\Users\giaccoyu\Desktop\Photos\Protoplast-20170817T144832Z-001\Protoplast',f))]

# print(Allfiles) # Return all the file names in the array
# Create a new array for the photos, one for each treatment
Photo_Array = []
j = 0
while j < len(Allfiles):
    if j % 6 == 3: # Select the photos with white background
        Photo_Array.append(Allfiles[j])
        j = j + 1
    else:
        j = j + 1

MMg = Photo_Array[0:25]  # The protoplasts results in MMg buffer
W5 = [Photo_Array[0]] + Photo_Array[26:]   # The protoplasts results in W5 buffer

plt.figure()

# Setting the legend and axis labels
x_label = ['0h','12h','18h','24h','36h']
y_label = ['Control', '3$\\mu$g/mL', '6$\\mu$g/mL', '9$\\mu$g/mL', '12$\\mu$g/mL', '15$\\mu$g/mL']

i = 0 # i is the variable indicating the position of subplot
k = 0 # k is the variable labelling the photos in Photo_Array
while k < len(MMg):
    if i == 0 or i % 5 != 0:
        img = Image.open(MMg[k])
        im = array(img)
        box = (1000,1000,2500,2500)
        region = img.crop(box)
        plt.subplot(6,5,i+1)
        plt.imshow(region)
        #axis('off')
        plt.tick_params(top='off', bottom='off', left='off', right='off', labelleft='off', labelbottom='off')
        if i == 0:
            title(x_label[i])
            plt.ylabel(y_label[i/5])
            i = i + 1
        elif i < 5:
            title(x_label[i])
            i = i + 1
        else:
            i = i + 1
        k = k + 1
    else:
        plt.subplot(6,5,i+1)
        plt.ylabel(y_label[i/5])
        #axis('off')
        plt.tick_params(top='off', bottom='off', left='off', right='off', labelleft='off', labelbottom='off',axis='x',
                        colors = 'red')
        xticks([])
        yticks([])
        axis('image')
        i = i + 1


# Test the image reading processes
# img = Image.open('C:\Users\giaccoyu\Desktop\Photos\Protoplast-20170817T144832Z-001\Protoplast\MMg_0_12h_1A.jpg')

# figure()
# subplot(6,5,1)
plt.show()
