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
    return calculate(n - 1, d) if d < @p[n - 1]
    [calculate(n - 1, d), @v[n - 1] + calculate(n - 1, @p[n - 1] - @k)].max
  end
end

def line_to_array(line)
  line.split(' ').map(&:to_i)
end

def test
  test_cases = STDIN.gets.chomp.to_i

  test_cases.times do
    number_and_distance = line_to_array(STDIN.gets.chomp)
    number_of_items = number_and_distance.first
    min_distance = number_and_distance.last
    positions = line_to_array(STDIN.gets.chomp)
    values = line_to_array(STDIN.gets.chomp)

    radar = Radar.new(number_of_items, positions, values, min_distance)
    result = radar.calculate

    puts result
  end
end
