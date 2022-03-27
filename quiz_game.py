#Message for the user
print("Welcome to my Triva Game!")

#Ask the user would they like to try to answer 10 questions.
playing = input("Would you like to answer questions? ")
if playing.lower() != "yes":
    quit()

print("Okay! I will ask!")
score = 0

#Begins asking questions and keeps score of how many questions were answered correctly.
answer = input("Question 1: What is 6 * 5? ")
if answer == "30":
    print("Correct, keep going!")
    score +=1
else:
    print("Incorrect!")

answer = input("Question 2: How many continents are there in the world? ")
if answer == "7":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 3: What does the F stand for in FBI? ")
if answer.lower() == "federal":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 4: Which state is called the Golden state? ")
if answer.lower() == "california":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 5: What color is the M in McDonald’s? ")
if answer.lower() == "yellow":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 6: Is 2 a prime number? ")
if answer.lower() == "yes":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 7: Which fictional city is the home of Batman? ")
if answer.lower() == "gotham city":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 8: What is the name of the fairy in Peter Pan? ")
if answer.lower() == "tinkerbell":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 9: What color is the circle on the Japanese national flag? ")
if answer.lower() == "red":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

answer = input("Question 10: How many sides does an octagon have? ")
if answer.lower() == "eight":
    print("Correct, keep going!")
    score += 1
else:
    print("Incorrect!")

#Gives the user how many answers they got right and their percentage on the game.
print("You got " + str(score) + " questions correct!")
print("You got " + str((score/ 10) * 100) + "%")