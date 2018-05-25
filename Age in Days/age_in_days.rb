age = STDIN.gets.chomp.to_i
year = age / 365
months = (age % 365) / 30
days = ((age % 365) % 30)
print year.to_s << ' ano(s)' << "\n"
print months.to_s << ' mes(es)' << "\n"
print days.to_s << ' dia(s)' << "\n"
