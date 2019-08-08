import time

with open('poem.txt') as file:
    for line in file:
        print(line)
        time.sleep(1)
