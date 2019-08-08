bri = set(['brazil', 'russia', 'india'])
print('brazil' in bri)
print('usa' in bri)

bric = bri.copy()
bri.add('china')
print(bric.issuperset(bri))

bric.remove('russia')
print('bri', bri)
print('bric', bric)
print(bric & bri)

# bri = set(['brazil', 'russia', 'india'])
# 'india' in bri
# 'usa' in bri
# bric = bri.copy()
# bric.add('china')
# bric.issuperset(bri)
# bri.remove('russia')
# bri & bric # OR bri.intersection(bric)
