x = 50

def scope(x):
    print('scope 1', x)
    x = 30
    print('scope 2', x)

print('start', x)
scope(x)
print('later', x)
