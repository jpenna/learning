while True:
    s = input('type something: ')
    if s == quit:
        print('ok... quiting')
        break
    if len(s) < 3:
        print('too small')
        continue
    print('input greater than 3')
