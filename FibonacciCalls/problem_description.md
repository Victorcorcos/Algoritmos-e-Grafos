## Algorithm made to solve the problem of how many recursive calls there are in the fibonacci sequence, also calculating the fibonacci value.
This problem was published on URI (Online Judge PROBLEMS & CONTESTS)
> https://www.urionlinejudge.com.br/judge/en/problems/view/1029


Currently, this is the fastest algorithm done in Ruby to solve this problem, according to the URI's own website (0.040 s). :D


# Problem solution

To solve this problem with a very high performance, I used Dynamic Programming.
I noticed that the number of recursive calls of fib(n) is actually: fib(n - 1) + fib(n - 2) + 2
And I created the array based on this rule.

fib(0) = 0  => 0
fib(1) = 0  => 0
fib(2) = 2  => fib(1) + fib(0) + 2
fib(3) = 4  => fib(2) + fib(1) + 2
fib(4) = 8  => fib(3) + fib(2) + 2
fib(5) = 14 => fib(4) + fib(3) + 2
fib(6) = 24 => fib(5) + fib(4) + 2

### Input
The first input line contains a single integer N, indicating the number of test cases. Each test case contains an integer number X (1 ≤ X ≤ 39) .

### Output
For each test case we will have an output line, in the following format: fib(n) = num_calls calls = result, where num_calls is the number of recursive calls, always with a space before and after the equal sign, as shown below.
