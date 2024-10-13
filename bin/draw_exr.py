#!/usr/bin/python
import sys
#os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1" # needs to be set before importing cv2

import cv2
import matplotlib.pyplot as plt

img = cv2.imread(sys.argv[1], cv2.IMREAD_ANYCOLOR | cv2.IMREAD_ANYDEPTH)

plt.imshow(img)
plt.colorbar()
plt.show()

