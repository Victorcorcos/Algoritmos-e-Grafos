def fractional_knapsack(p, v, n, c)
  j = n - 1
  x = []
  while j >= 0 && p[j] <= c do
    x[j] = 1
    c = c - p[j]
    j = j - 1
  end
  if j >= 0
    x[j] = c / p[j].to_f
    (j - 1).downto 0 do |i|
      x[i] = 0
    end
  end
  x
end

v = [10, 20, 30, 40]
p = [20, 20, 30, 30]
n = 4
c = 70
res = fractional_knapsack(p, v, n, c)

puts 'Result vector...'
ap res

res_value_vector = []
(0...n).each do |i|
  res_value_vector.push(res[i] * v[i])
end

puts 'Result value...'
ap res_value_vector.sum
