def fibonacci_calls(number)
  fib_results = [0, 1]
  fib_callbacks = [0, 0]
  (2..number + 1).each do |index|
    fib_results.push(fib_results[index - 1] + fib_results[index - 2])
    fib_callbacks.push(fib_callbacks[index - 1] + fib_callbacks[index - 2] + 2)
  end
  print 'fib(' << number.to_s << ') = ' << fib_callbacks[number].to_s << ' calls = ' << fib_results[number].to_s << "\n"
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
def fibonacci_top_down(value)
  return value if value < 2
  fibonacci_top_down(value - 1) + fibonacci_top_down(value - 2)
end

# Top-Down with memoization
@cache = {}
def fibonacci_memo(value)
  return value if value < 2
  return @cache[value] if @cache.key? value
  result = fibonacci_memo(value - 1) + fibonacci_memo(value - 2)
  @cache[value] = result
  result
end

# Bottom-Up with Array
def fibonacci_bottom_up_array(value)
  fib_results = [0, 1]
  (2..value + 1).each do |index|
    fib_results.push(fib_results[index - 1] + fib_results[index - 2])
  end
  fib_results[value]
end

# Bottom-Up with just Auxiliary Variables (Space Saving)
def fibonacci_bottom_up_variables(value)
  first_before = 1
  second_before = 0
  result = 0
  return value if value < 2
  (2..value).each do
    result = first_before + second_before
    second_before = first_before
    first_before = result
  end
  result
end
