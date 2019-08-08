shoplist = ['cheese', 'bread', 'eggs']

print('I have to buy', shoplist);

print('These items are:', end=' ')
for item in shoplist:
    print(item, end=' ')

print('\nremembered i need soap')
shoplist.append('soap')
print('Now my list is: ', shoplist)

print('sort my list')
shoplist.sort()
print('\nmy sorted list', shoplist)
