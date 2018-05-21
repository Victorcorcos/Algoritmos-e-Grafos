def fibonacci_calls(number)
  fib_results = [0, 1]
  fib_callbacks = [0, 0]
  (2..number + 1).each do |index|
    fib_results.push(fib_results[index - 1] + fib_results[index - 2])
    fib_callbacks.push(fib_callbacks[index - 1] + fib_callbacks[index - 2] + 2)
  end
  puts "fib(#{number}) = #{fib_callbacks[number]} calls = #{fib_results[number]}"
end

test_cases = STDIN.gets.chomp.to_i

test_cases.times do
  number = STDIN.gets.chomp.to_i
  fibonacci_calls(number)
end


###
# More Fibonacci Functions below...
###
# Top-Down
# Bottom-Up with Array
# Bottom-Up with just Auxiliary Variables (Space Saving)

def fibonacci_top_down(n)
  return n if n < 2
  return fibonacci_top_down(n - 1) + fibonacci_top_down(n - 2)
end

def fibonacci_bottom_up_array(n)
  fib_results = [0, 1]
  (2..n+1).each do |index|
    fib_results.push(fib_results[index - 1] + fib_results[index - 2])
  end
  fib_results[n]
end

def fibonacci_bottom_up_variables(n)
  first_before = 1
  second_before = 0
  result = 0
  return second_before if n == 0
  return first_before if n == 1
  (2..n).each do
    result = first_before + second_before
    second_before = first_before
    first_before = result
  end
  result
end
