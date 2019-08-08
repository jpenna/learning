x = 50

def scoped():
    global x
    x = 30
    print('scoped', x)

print('out 1', x)
scoped()
print('out 2', x)
