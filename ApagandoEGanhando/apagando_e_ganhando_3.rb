require 'scanf'

# Solves the Silvio Santos problem :D
class EraseAndWin
  def initialize(total_digits, digits_to_erase, entry)
    @total_digits = total_digits
    @digits_to_erase = digits_to_erase
    @entry = entry.to_s.split('').map(&:to_i)
    @stack = []
  end

  def calculate
    @stack.push(@entry.first)
    @entry.shift

    @entry.each do |current_digit|
      if current_digit > @stack.last && @digits_to_erase > 0
        @stack.pop
        @stack.push(current_digit)
        @digits_to_erase -= 1
      else
        @stack.push(current_digit)
      end
    end

    @digits_to_erase.times do
      @stack.pop
    end

    print_stack
  end

  def print_stack
    @stack.each do |item|
      print item
    end
    puts
  end
end

loop do
  line = scanf('%d%d')

  total_digits = line.first
  digits_to_erase = line.last

  break if total_digits.zero? && digits_to_erase.zero?

  entry = STDIN.gets.chomp.to_i

  erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
  erase_and_win.calculate
end

# ## First test
# total_digits = 4
# digits_to_erase = 2
# entry = 3759
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Second test
# total_digits = 6
# digits_to_erase = 3
# entry = 123123
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Third test
# total_digits = 7
# digits_to_erase = 4
# entry = 1000000
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Fourth test
# total_digits = 7
# digits_to_erase = 3
# entry = 1001234
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Fifth test
# total_digits = 6
# digits_to_erase = 2
# entry = 103759
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

