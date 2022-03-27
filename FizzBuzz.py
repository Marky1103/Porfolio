# Print integers 1 to 50 but print "Fizz" if an integer is divisible by 3,
# "Buzz" if an integer is divisble by 5,
# and "FizzBuzz" if an integer is divisible by both 3 and 5

for fbnum in range(51):
    if fbnum % 3 == 0:
        print("Fizz")
    elif fbnum % 5 == 0:
        print("Buzz")
    elif fbnum % 3 == 0 and fbnum % 5 == 0:
        print("FizzBuzz")
    else:
        print(fbnum)