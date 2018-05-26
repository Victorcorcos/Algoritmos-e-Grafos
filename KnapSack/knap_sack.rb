########################
###    KnapSack      ###
##     Top-Down       ##
#     Brute Force      #
def knap_sack(n, c)
  return 0 if n.zero? || c.zero?
  return knap_sack(n - 1, c) if @w[n - 1] > c
  [knap_sack(n - 1, c), @v[n - 1] + knap_sack(n - 1, c - @w[n - 1])].max
end

n = 4
c = 30
@w = [12, 13, 2, 19]
@v = [98, 25, 97, 95]
knap_sack(n, c)

n = 5
c = 20
@w = [12, 3, 12, 9, 11]
@v = [98, 25, 97, 95, 48]
knap_sack(n, c)

########################
###    KnapSack      ###
##     Top-Down       ##
# Dynamic Programming  #
def knap_sack_dynamic(n, c)
  return @cache[[n, c]] if @cache.key? [n, c]
  return 0 if n.zero? || c.zero?
  res = [knap_sack_dynamic(n - 1, c), @v[n - 1] + knap_sack_dynamic(n - 1, c - @w[n - 1])].max
  res = knap_sack_dynamic(n - 1, c) if @w[n - 1] > c
  @cache[[n, c]] = res
end

n = 4
c = 30
@w = [12, 13, 2, 19]
@v = [98, 25, 97, 95]
@cache = {}
knap_sack_dynamic(n, c)

n = 5
c = 20
@w = [12, 3, 12, 9, 11]
@v = [98, 25, 97, 95, 48]
@cache = {}
knap_sack_dynamic(n, c)












def knap_sack(n, c)
  return 0 if n.zero? || c.zero?
  return knap_sack(n - 1, c) if @w[n - 1] > c
  [knap_sack(n - 1, c), @v[n - 1] + knap_sack(n - 1, c - @w[n - 1])].max
end

def knap_sack_dynamic(n, c)
  return @cache[[n, c]] if @cache.key? [n, c]
  return 0 if n.zero? || c.zero?
  res = knap_sack_dynamic(n - 1, c) if @w[n - 1] > c
  res = [knap_sack_dynamic(n - 1, c), @v[n - 1] + knap_sack_dynamic(n - 1, c - @w[n - 1])].max
  @cache[[n, c]] = res
end

n = 4
c = 30
@w = [12, 13, 2, 19]
@v = [98, 25, 97, 95]
@cache = {}

knap_sack(n, c)

knap_sack_dynamic(n, c)


performance do
  100.times { knap_sack(n, c) }
end

performance do
  100.times { knap_sack_dynamic(n, c) }
end


