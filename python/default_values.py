def func(x, y = 9):
    print('hello {0} and {1}'.format(x, y))

func('people')
func('people', 'grey    ')

def func2(x = 'itic', y = 9):
    print('hello {0} and {1}'.format(x, y))

func2()

def func3(x = 'itic', y):
    print('hello {0} and {1}'.format(x, y))

func3('oi')
