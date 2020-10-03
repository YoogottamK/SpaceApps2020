import numpy as np
import cv2 as cv

c = np.zeros((40, 40, 4))
c[19:21, :, 2:] = 255
c[:, 19:21, 2:] = 255

cv.imwrite("crosshair.png", c)
