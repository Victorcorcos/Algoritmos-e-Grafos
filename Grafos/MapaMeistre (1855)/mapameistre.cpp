#include <stdio.h>
#include <string.h>
#include <iostream>

using namespace std;

int main()
{
    int largura, altura, passos, sentido, passos_maximo;
    int linha = 0, coluna = 0;
    int fim = 1000;

    scanf("%d", &largura);
    scanf("%d", &altura);
    char mapa[altura][largura+1];

    int i;
    for (i = 0; i < altura; i++) {
        scanf("%s", mapa[i]);
    }

    passos_maximo = largura * altura;
    passos = 1;

    while (passos <= passos_maximo)
    {
        if (mapa[linha][coluna] == '>')
        {
            coluna += 1;
            passos += 1;
            sentido = 1;
            if (coluna >= largura) break;
        }
        else if (mapa[linha][coluna] == 'v')
        {
            linha += 1;
            passos += 1;
            sentido = 2;
            if (linha >= altura) break;
        }
        else if (mapa[linha][coluna] == '<')
        {
            coluna -= 1;
            passos += 1;
            sentido = 3;
            if (coluna < 0) break;
        }
        else if (mapa[linha][coluna] == '^')
        {
            linha -= 1;
            passos += 1;
            sentido = 4;
            if (linha < 0) break;
        }
        else if (mapa[linha][coluna] == '*')
        {
            passos = fim;
            break;
        }
        else if (mapa[linha][coluna] == '.')
        {
            if (sentido == 1)
            {
                coluna += 1;
                passos += 1;
                if (coluna >= largura) break;
            }
            else if (sentido == 2)
            {
                linha += 1;
                passos += 1;
                if (linha >= altura) break;
            }
            else if (sentido == 3)
            {
                coluna -= 1;
                passos += 1;
                if (coluna < 0) break;
            }
            else if (sentido == 4)
            {
                linha -= 1;
                passos += 1;
                if (linha < 0) break;
            }
        }
    }

    if (passos == fim) cout << "*" << '\n';
    else cout << "!" << '\n';

    return 0;
}