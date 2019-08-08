try:
    s = input('type a text ')
except EOFError:
    print('WTF man!')
except KeyboardInterrupt:
    print('You cancelled the operation.')
else:
    print('OH god! Thanks! you said {}'.format(s))
