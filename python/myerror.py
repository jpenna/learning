class InputSmall(Exception):
    def __init__(self, length, expected):
        Exception.__init__(self)
        self.length = length
        self.expected = expected

    def reportError(self):
        print('You did bad job. Wrote {} chars and at least {} chars are expected'.format(self.length, self.expected))


try:
    s = input('type text of at least 5 char: ')
    if (len(s) < 5):
        raise InputSmall(len(s), 5)
except InputSmall as small:
    small.reportError()
except:
    print('default error')
else:
    print('you wrote ok. What it was? "{}"'.format(s))
