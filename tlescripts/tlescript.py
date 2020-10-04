  
file1 = open('3le.txt', 'r') 
file3 = open('out1.json', 'w') 
count = 0

from math import cos 
from math import sin
from math import atan
from math import radians


finlist = []
while True: 
    count += 1
  
    # Get next line from file
    
    kons= 10
    line = file1.readline() 
    if count%3==0:
        arr = line.split()
        jsdict={}
        jsdict['inclination']= round(radians(float(arr[2])),3)
        jsdict['omega'] = round(radians(float(arr[3])),3)
        jsdict['e'] = round(float("0."+str(arr[4])),3)
        jsdict['argper'] = round(radians(float(arr[5])),3)
        jsdict['anamoly']= round(radians(float(arr[6])),3)
        jsdict['rot_speed'] = round(float(arr[7])/15,3)
        jsdict['radius'] = jsdict['rot_speed']*20
        abyb = (1 - jsdict['e']**2)**0.5
        jsdict['b'] = round(kons/((abyb+1) * jsdict['rot_speed']**2),3)
        jsdict['a'] = round(abyb * jsdict['b'],3)
        anomaly = jsdict['anamoly']
        A= jsdict['a']
        B= jsdict['b']
        jsdict['apogee'] = A+jsdict['e']
        jsdict['k']=round((1/((cos(anomaly) * cos(anomaly) / (A * A)) + (sin(anomaly) * sin(anomaly) / (B * B))))**0.5,3)
        k = jsdict['k']
        e=jsdict['e']
        jsdict['theta']= round(atan(k * sin(anomaly) / (e + k * cos(anomaly))),3)
        initx = cos(jsdict['theta'])*sin(jsdict['inclination'])*B
        inity = (A)*cos(jsdict['inclination'])*sin(jsdict['theta'])
        initz = sin(jsdict['inclination'])*cos(jsdict['anamoly'])*(A+jsdict['e'])
        jsdict['initpos'] = [round(initx,3),round(inity,3),round(initz,3)]
        finlist.append((jsdict))
        print (jsdict)
        #print (line)
  
    # if line is empty 
    # end of file is reached 
    if not line: 
        break
print (finlist)
import json
json.dump(finlist,file3)
file1.close() 
file3.close()
