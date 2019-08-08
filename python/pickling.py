import pickle

data = ['me', 'myself', 'I']

f = open('pickling.txt', 'wb')
pickle.dump(data, f)
f.close()

f = open('pickling.txt', 'rb')
retrieved = pickle.load(f)
print(retrieved)
