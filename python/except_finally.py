import time
import sys

try:
    f = open('poem.txt')
    while(True):
        line = f.readline()
        if (len(line) == 0):
            break
        print(line)
        sys.stdout.flush()
        time.sleep(2)
        print('press ctrl+c now')
except KeyboardInterrupt:
    print('you cancelled the programme')
finally:
    f.close()
    print('closing file')
