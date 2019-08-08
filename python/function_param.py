def print_max(a, b):
    if a > b:
        print('{} is greater than {}'.format(a, b))
    elif a == b:
        print('{} is equal to {}'.format(a, b))
    else:
        print('hey! {a} smaller than {b}'.format(a = a, b = b))

while True:
    a = input('type a: ')
    b = input('type b: ')
    if a == 'quit' or b == 'quit':
        print('done!')
        break
    print_max(a, b)
else:
    print('LETS DO AGAIN')
