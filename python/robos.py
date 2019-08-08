class Robos:
    'represents a robo'

    def __init__(self, name):
        self.name = name
        Robos.population += 1 # ++ works?

    population = 0

    def kill(self):
        Robos.population -= 1

    def say_hi(self):
        print('Hello, my name is {}'.format(self.name))

    @classmethod
    def how_many(cls):
        print('there are', cls.population, 'robos')


r = Robos('HRE')
p = Robos('QWE-12')

r.say_hi()
Robos.how_many()
r.how_many()

r.kill()
r.how_many()
