#1) In 100 coin tosses, what is the probability of having the same side come up 10 times in a row?
n <- 1e5
flips <- 100
length <- 10
num_success <- 0

for (i in 1:n){
  num_success <- num_success + (max(rle(rbinom(flips, 1, 0.5))$lengths) >= length)
}
num_success/n

#2) Six kids are standing in line. What is the probability that they are in alphabetical order by name? Assume no two children have the same exact name.
n <- 1e5
kids <- 1:6
num_success <- 0

for (i in 1:n) {
  num_success <- num_success + identical(sample(kids, size = 6), 1L:6L)
}
num_success/n

# or
1/factorial(6)

#3) Remember the kids from the last question? There are three boys and three girls. How likely is it that all the girls come first?
n <- 1e5
kids <- 1:6
num_success <- 0

for (i in 1:n) {
  num_success <- num_success + (sum(sample(kids, size = 3)) == 6L)
}
num_success/n

#4) In six coin tosses, what is the probability of having a different side come up with each throw, that is, that you never get two tails or two heads in a row?
(1/2)^5

#5) A random five-card poker hand is dealt from a standard deck. What is the chance of a flush (all cards are the same suit)?
4 * choose(13, 5) / choose(52, 5)
