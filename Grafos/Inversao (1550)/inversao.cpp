#include <bits/stdc++.h>

using namespace std;

int  casas_decimais(int qtd_algarismos);
int  preenchida(queue<pair<int, int> > fila);
int  inverte(int valor);
void busca_largura(int inicio, int destino);

int main() {
    int valor_inicial;
    int valor_desejado;
    int qtd_testes;
    scanf("%d", &qtd_testes);
    while (qtd_testes >= 1) {
        scanf("%d", &valor_inicial);
        scanf("%d", &valor_desejado);

        busca_largura(valor_inicial, valor_desejado);
        qtd_testes -= 1;
    }
    return 0;
}

int casas_decimais(int qtd_algarismos) {
    return pow(10, qtd_algarismos);
}

int preenchida(queue<pair<int, int> > fila) {
    return fila.size() >= 1;
}

int inverte(int valor) {
    int invertido = 0;
    int qtd_algarismos = 0;
    if (valor <= 9) return valor;
    while (static_cast<int>(valor / casas_decimais(qtd_algarismos)) >= 1) qtd_algarismos += 1;
    while (qtd_algarismos >= 1) {
        qtd_algarismos -= 1;
        invertido += casas_decimais(qtd_algarismos) * (valor % 10);
        valor = valor / 10;
    }
    return invertido;
}

void busca_largura(int inicio, int destino) {
    int invertido;
    pair<int, int> atual;
    map<int, bool> examinado;
    queue<pair<int, int> > fila_arestas;
    fila_arestas.push(make_pair(inicio, 0));

    examinado[inicio] = true;

    while (preenchida(fila_arestas)) {
        atual = fila_arestas.front();
        if (atual.first == destino) {
            printf("%d\n", atual.second);
            break;
        }
        fila_arestas.pop();
        if (!examinado[atual.first + 1]) {
            examinado[atual.first + 1] = true;
            fila_arestas.push(make_pair(atual.first + 1, atual.second + 1));
        }
        invertido = inverte(atual.first);
        if (!examinado[invertido]) {
            examinado[invertido] = true;
            fila_arestas.push(make_pair(invertido, atual.second + 1));
        }
    }
}
