def sumpower(power, *args):
    sum = 0
    print(args)
    for arg in args:
        sum += pow(arg, power)
    return sum

sum = sumpower(3, 2, 5,4,21)
print(sum)
