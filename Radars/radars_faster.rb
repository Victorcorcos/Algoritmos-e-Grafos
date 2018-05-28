def line_to_array(line)
  line.split(' ').map(&:to_i)
end

maximum = 40000

test_cases = STDIN.gets.chomp.to_i

test_cases.times do
  memo = [0] * maximum
  max_radar = 0

  min_distance = STDIN.gets.chomp.split(' ').last.to_i

  positions = line_to_array(STDIN.gets.chomp)
  max_radar = positions.max

  values = [0] * maximum
  value_inputs = line_to_array(STDIN.gets.chomp)
  value_inputs.each_with_index do |current_value, i|
    values[positions[i]] = current_value if current_value > values[positions[i]]
  end

  max_radar += (min_distance + 1)

  (max_radar).downto 1 do |i|
    memo[i-1] = memo[i]

    if (values[i-1] && ((memo[i-1+min_distance] + values[i-1]) > memo[i-1]))
      memo[i-1] = memo[i-1+min_distance] + values[i-1]
    end
  end

  puts memo[0]
end
