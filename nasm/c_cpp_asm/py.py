import pickle
import json


class Person:
    def __init__(self, name, age, sex):
        self.name = name
        self.age = age
        self.sex = sex

    def show(self):
        print(self.name)
        print(self.age)
        print(self.sex)



#p1 = Person('Max', 13, 'man')

with open('mydata.json', 'r') as f:
    json_object = json.loads(f.read())

print(json_object)



#with open('max.pickle', 'wb') as f:
#    pickle.dump(p1, f)


#with open('max.pickle', 'rb') as fi:
#    p2 = pickle.load(fi)



#p2.show()

