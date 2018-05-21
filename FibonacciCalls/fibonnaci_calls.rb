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
