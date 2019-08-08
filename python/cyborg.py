# from robos import Robos
import robos

class Cyborg(robos.Robos):
    'create a CYBORG!!'

    def __init__(self, name, size):
        robos.Robos.__init__(self, name)
        self.size = size
        self.position = 0


    def walk(self, distance):
        self.position += distance

    def report(self):
        self.say_hi()
        print('And i am at position', self.position, 'and my size is', self.size)

print()
print(Cyborg.__doc__)
print()

r = Cyborg('Robert', '3')
p = Cyborg('Prast', '5')

r.report()
p.report()

print()

r.walk(90)
p.walk(7)

r.report()
p.report()
