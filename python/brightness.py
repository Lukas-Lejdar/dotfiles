import os
import subprocess
import numpy
import argparse

CONFIG_FILE_LENGTH = 3

# Parse arguments --------------------------

parser = argparse.ArgumentParser()

parser.add_argument('--inc', '-i', type=float)
parser.add_argument('-D', help="Displays")
parser.add_argument('-s', help="set Brightness", type=float)
parser.add_argument('-r', help="toggle red shift", action='store_true')

args = parser.parse_args()

# Parse config --------------------------

f = open('/home/lukas/python/brightness_config', 'a+')
f.seek(0)
lines = f.readlines()
lines = lines[:CONFIG_FILE_LENGTH] + ['']*(CONFIG_FILE_LENGTH-len(lines))

isAlreadyRunning = False
hasRedshift = False
lastDisplayedPromt = ''

try:
    isAlreadyRunning = lines[0].lower() in ['true', 'true\n', '1']

    lastDisplayedPromt = lines[1]
    hasRedshift = lines[2].lower() in ['true', 'true\n', '1']
except:
    print('Reading config failed')

lines[0] = 'True'
lines[1] = str(args.D or '')

f.truncate(0)
f.write('\n'.join(lines))

# Det Display info --------------------------

out = subprocess.check_output("xrandr | grep ' connected' | awk '{print $1}'", shell = True)
displays = out.decode('utf-8').split('\n')
displays.pop()

out = subprocess.check_output("xrandr --verbose | grep 'Brightness' | awk '{print $2}'", shell = True)
brightness = out.decode('utf-8').split('\n')
brightness.pop()

# Handle brightness --------------------------


def resetRedShiftOnDisplay(i):
    print(f"reset {displays[i]} to {brightness[i]}")
    os.system(f"xrandr --output {displays[i]} --brightness {float(brightness[i])}")


def applyChange(i):
    newBr = float(brightness[i])

    if (args.s is not None):
        newBr = args.s
    elif (args.inc is not None):
        frac = newBr/2+0.5
        newBr = numpy.clip(newBr+args.inc*frac, 0.1, 1)

    os.system(f"xrandr --output {displays[i]} --brightness {newBr}")
    print(f"changed {displays[i]} to {newBr}")


if (args.D is not None):
    toApply = args.D.split(',')
    [applyChange(int(k)) for k in toApply]

else:
    [applyChange(k) for k in range(len(displays))]

# Handle redshift --------------------------


if (args.r):
    hasRedshift = not hasRedshift
    if (hasRedshift):
        os.system("redshift -O 4000")

    lines[2] = str(hasRedshift)

lines[0] = 'False'
f.truncate(0)
f.write('\n'.join(lines))
f.close()

