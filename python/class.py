class Person():
    def __init__(self, name):
        self.name = name

    def sayHi(self):
        print('hello', self.name)


p = Person('Juliano')
p.sayHi()
print(p)
