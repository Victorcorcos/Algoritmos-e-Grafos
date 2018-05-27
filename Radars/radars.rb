def line_to_array(line)
  line.split(' ').map(&:to_i)
end

maximum = 1000 * 100 + 10

test_cases = STDIN.gets.chomp.to_i

test_cases.times do
  memo = []
  aux = []

  number_and_distance = line_to_array(STDIN.gets.chomp)
  min_distance = number_and_distance.last

  positions = []
  position_inputs = line_to_array(STDIN.gets.chomp)
  position_inputs.each_with_index do |current_position, i|
    positions[i] = current_position
    aux[positions[i]] = 1
  end

  values = []
  value_inputs = line_to_array(STDIN.gets.chomp)
  value_inputs.each_with_index do |current_value, i|
    values[positions[i]] = [values[positions[i]], current_value].map(&:to_i).max
  end

  (maximum - 2).downto 0 do |i|
    memo[i] = memo[i + 1]
    if aux[i] && (i + min_distance < maximum)
      memo[i] = [memo[i], values[i] + memo[i + min_distance].to_i].map(&:to_i).max
    end
  end

  puts memo[0]
end

# TopDown Recursive Radar solution
# URI will not accept this, since it will cause a Stack Overflow
class Radar
  def initialize(number_of_items, positions, values, min_distance)
    @n = number_of_items
    @p = positions
    @v = values
    @k = min_distance
    @d = @p.last # Relative distance
  end

  def calculate(n = @n, d = @d)
    return 0 if n.zero? || d.zero?
    if d < @p[n - 1]
      return radar = calculate(n - 1, d)
    else
      return [calculate(n - 1, d), @v[n - 1] + calculate(n - 1, @p[n - 1] - @k)].max
    end
  end
end


# #### Test Cases ####
# number_of_items = 2
# positions = [1, 1]
# values = [3, 2]
# min_distance = 1
# radar = Radar.new(number_of_items, positions, values, min_distance)
# radar.calculate

# radar = BottomUpRadar.new(number_of_items, positions, values, min_distance)
# radar.calculate

# number_of_items = 3
# positions = [1, 2, 3]
# values = [2, 5, 3]
# min_distance = 2
# radar = Radar.new(number_of_items, positions, values, min_distance)
# radar.calculate

# number_of_items = 5
# positions = [1, 5, 10, 15, 17]
# values = [5, 20, 10, 15, 25]
# min_distance = 5
# radar = Radar.new(number_of_items, positions, values, min_distance)
# radar.calculate