require 'scanf'

# Solves the Silvio Santos problem :D
class EraseAndWin
  def initialize(total_digits, digits_to_erase, entry)
    @total_digits = total_digits
    @digits_to_erase = digits_to_erase
    @entry = entry.to_s
    @top = -1
    @position = 0
    @output = ''
  end

  def calculate
    while @digits_to_erase.positive?
      # debugger('outer')

      if @top == -1
        @top += 1
        @output[@top] = @entry[@position]
        @position += 1
      end

      if @output[@top] < @entry[@position]
        @top -= 1
        @digits_to_erase -= 1
        next
      end

      @top += 1
      @output[@top] = @entry[@position]
      @position += 1

      if (@position + 1) == @total_digits
        while @digits_to_erase.positive?
          @digits_to_erase -= 1
          @top -= 1
        end
      end

      # debugger('outer after')
    end

    for i in (@position + 1)..@total_digits do
      @top += 1
      @output[@top] = @entry[i].to_s

      # debugger('inner')
    end

    @output = @output[(0..(@top + 1))]

    puts @output
  end

  # def debugger(type)
  #   @top
  #   @position
  #   @entry
  #   @output

  #   puts '#' * 90
  #   case type
  #   when 'inner'
  #     puts 'Inner puts'
  #   when 'outer'
  #     puts 'Outer puts'
  #   when 'outer after'
  #     puts 'Outer after puts'
  #   end
  #   puts '@top: ' + @top.to_s
  #   puts '@position: ' + @position.to_s
  #   puts '@entry: ' + @entry.to_s
  #   puts '@output: ' + @output.to_s
  #   puts '#' * 90
  # end
end

loop do
  line = scanf('%d%d')

  total_digits = line.first
  digits_to_erase = line.last

  break if total_digits.zero? && digits_to_erase.zero?

  entry = STDIN.gets.chomp

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
# entry = 100000
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Fourth test
# total_digits = 7
# digits_to_erase = 3
# entry = 1001234
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# # Extra
# total_digits = 3
# digits_to_erase = 3
# entry = 109807
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate

# ## Fifth test
# total_digits = 6
# digits_to_erase = 2
# entry = 103759
# erase_and_win = EraseAndWin.new(total_digits, digits_to_erase, entry)
# erase_and_win.calculate
