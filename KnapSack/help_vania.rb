# KnapSack problem
class Knapsack
  def initialize(items)
    @items = items
  end

  def fill_the_bag(capacity)
    return 0 if capacity.zero? || @items.size.zero?

    @capacity = capacity
    @weights  = @items.map { |item| item[:weight] }.unshift(0)
    @values   = @items.map { |item| item[:value] }.unshift(0)
    @bag      = Array.new(@items.size + 1).map { [0] * (capacity + 1) }

    (1..@items.size).each do |item|
      (1..capacity).each do |capacities|
        last_item = @bag[item - 1]
        @bag[item][capacities] = if @weights[item] > capacities
                                   last_item[capacities]
                                 else
                                   [last_item[capacities - @weights[item]] + @values[item], last_item[capacities]].max
                                 end
      end
    end
    @bag[@items.size][capacity]
  end
end

def line_to_array(line)
  line.split(' ').map(&:to_i)
end

caso = 1

loop do
  line = STDIN.gets.chomp
  break if line == '0 0'
  line_items = line_to_array(line)
  number_of_books = line_items.first
  capacity = line_items.last
  items = []

  # Get all weights and values for the current test case
  (1..number_of_books).each do
    line = STDIN.gets.chomp
    line_items = line_to_array(line)
    weight = line_items.first
    value = line_items.last

    items.push(weight: weight, value: value)
  end

  # Execute the Knapsack problem for the current test case
  vania_problem = Knapsack.new(items)
  result = vania_problem.fill_the_bag(capacity)

  puts "Caso #{caso}: #{result}"
  caso += 1
end
