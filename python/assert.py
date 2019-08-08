list = ['apenas um']
assert len(list) > 0
print('its ok')
list.pop()
assert len(list) > 0 # throw exception
