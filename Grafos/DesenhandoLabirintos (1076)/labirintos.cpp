#include <bits/stdc++.h>
#define endl '\n'

using namespace std;

queue<int> nodos;

void inicializa_examinados(int *examinados, int qtd_vertices);
void limpa_adjacencias(vector<int> *adjacencias, int qtd_vertices);
void preenche_adjacencias(vector<int> *adjacencias, int qtd_arestas);
void soluciona(vector<int> *adjacencias, int *examinados);

int main(void)
{
  int nodo;
  int qtd_vertices, qtd_arestas, qtd_testes;

  cin >> qtd_testes;
  int i = qtd_testes;

  while (i) {
    cin >> nodo >> qtd_vertices >> qtd_arestas;

    int examinados[qtd_vertices];
    inicializa_examinados(examinados, qtd_vertices);

    vector<int> adjacencias[qtd_vertices];
    limpa_adjacencias(adjacencias, qtd_vertices);
    preenche_adjacencias(adjacencias, qtd_arestas);

    nodos.push(nodo);
    examinados[nodo] = 1;
    soluciona(adjacencias, examinados);
    i -= 1;
  }
  return 0;
}

void inicializa_examinados(int *examinados, int qtd_vertices) {
  for(int i = 0; i < qtd_vertices; examinados[i] = 0, i++);
}

void limpa_adjacencias(vector<int> *adjacencias, int qtd_vertices) {
  int i = qtd_vertices - 1;

  while (i) {
    adjacencias[i].clear();
    i -= 1;
  }
}

void preenche_adjacencias(vector<int> *adjacencias, int qtd_arestas) {
  int inicio, fim;
  int i = qtd_arestas;

  while (i) {
    cin >> inicio >> fim;
    adjacencias[inicio].push_back(fim);
    adjacencias[fim].push_back(inicio);
    i -= 1;
  }
}

void soluciona(vector<int> *adjacencias, int *examinados) {
  int movimentos = 0;
  int mov_correto = 0;

  while (nodos.size()) {
    int gvertice = adjacencias[nodos.front()].size();
    int i = 0;
    while (i < gvertice) {
      int seguinte = adjacencias[nodos.front()][i];
      if (!examinados[seguinte]) {
        examinados[seguinte] = 1;
        nodos.push(adjacencias[nodos.front()][i]);
        movimentos += 1;
      }
      i += 1;
    }
    movimentos += 1;
    nodos.pop();
  }
  mov_correto = movimentos - 1;
  cout << mov_correto << endl;
}
