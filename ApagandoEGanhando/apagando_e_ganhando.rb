# Solves the Silvio Santos problem :D
class EraseAndWin
  def initialize(total_digits, digits_to_erase, entry)
    @total_digits = total_digits
    @digits_to_erase = digits_to_erase
    @entry = entry.to_s.split('').map(&:to_i)
  end

  def calculate
    @digits_to_erase.times do
      minimum = @entry.min
      remove_from_left!(@entry, minimum)
    end

    print_entry
  end

  def remove_from_left!(array, value)
    array.each_with_index do |item, index|
      if item == value
        array.delete_at(index)
        return true
      end
    end
    false
  end

  def print_entry
    @entry.each do |item|
      print item
    end
    puts
  end
end

def line_to_array(line)
  line.split(' ').map(&:to_i)
end

loop do
  line = STDIN.gets.chomp
  break if line == '0 0'
  totals_and_to_erase = line_to_array(line)
  total_digits = totals_and_to_erase.first
  digits_to_erase = totals_and_to_erase.last

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
