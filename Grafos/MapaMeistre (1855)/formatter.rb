while passos <= passos_maximo do
  if mapa[linha][coluna] == '>'
    coluna += 1
    passos += 1
    sentido = 1
    break if coluna >= largura
  elsif mapa[linha][coluna] == 'v'
    linha += 1
    passos += 1
    sentido = 2
    break if linha >= altura
  elsif mapa[linha][coluna] == '<'
    coluna -= 1
    passos += 1
    sentido = 3
    break if coluna < 0
  elsif mapa[linha][coluna] == '^'
    linha -= 1
    passos += 1
    sentido = 4
    break if linha < 0
  elsif mapa[linha][coluna] == '*'
    passos = fim
    break
  elsif mapa[linha][coluna] == '.'
    if sentido == 1
      coluna += 1
      passos += 1
      break if coluna >= largura
    elsif sentido == 2
      linha += 1
      passos += 1
      break if linha >= altura
    elsif sentido == 3
      coluna -= 1
      passos += 1
      break if coluna < 0
    elsif sentido == 4
      linha -= 1
      passos += 1
      break if linha < 0
    end
  end
end