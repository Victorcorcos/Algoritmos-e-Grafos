require 'scanf'

# Solves the Silvio Santos problem :D
class EraseAndWin
  def initialize(total_digits, digits_to_erase, entry)
    @total_digits = total_digits
    @digits_to_erase = digits_to_erase
    @entry = entry.to_s.split('').map(&:to_i)
    @sorted_digits = @entry.sort
  end

  def calculate
    while @digits_to_erase > 0
      minimum = @sorted_digits.first

      @entry.each_with_index do |item, index|
        next if item != minimum
        @entry.delete_at(index)
        @digits_to_erase -= 1
        break if @digits_to_erase.zero?
      end

      @sorted_digits.shift
    end

    print_entry
  end

  def print_entry
    @entry.each do |item|
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

