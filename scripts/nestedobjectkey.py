#----------------Challenge #3--------------------------
#We have a nested object. We would like a function where you pass in the object and a key and get back the value.
#Example Inputs
#object = {“a”:{“b”:{“c”:”d”}}}
#key = a/b/c
#object = {“x”:{“y”:{“z”:”a”}}}
#key = x/y/z
#value = a

#----------------Solution-------------------

def getNestedValue(obj, key):
    keys = key.split('/')
    current = obj
    for k in keys:
        current = current.get(k)
        if current is None:
            return f"Key {key} not exists"
    return current      

# Tests
obj = {'a':{'b':{'c':'d'}}}
key = "a/b/c"
print (getNestedValue(obj, key))

obj = {"x":{"y":{"z":"a"}}}
key = "x/y"
print (getNestedValue(obj, key))

obj = {"x":{"y":{"z":"a"}}}
key = "x"
print (getNestedValue(obj, key))

obj = {"x":{"y":{"z":"a"}}}
key = "k" # No key present in dictionary
print (getNestedValue(obj, key))