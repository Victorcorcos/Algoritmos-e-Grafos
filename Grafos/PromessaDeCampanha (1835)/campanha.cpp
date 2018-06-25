#include <bits/stdc++.h>
#define MAX 200

int adjacencias[MAX];

int  caminho(int vertice);
void preenche_adjacencia(int inicio, int fim);
void promessa_de_campanha();

int main() {
  int qtd_testes;
  scanf("%d", &qtd_testes);
  int caso_de_teste = 1;
  while (qtd_testes > 0) {
    printf("Caso #%d: ", caso_de_teste);
    caso_de_teste += 1;
    promessa_de_campanha();
    qtd_testes -= 1;
  }
  return 0;
}

int caminho(int vertice) {
  if (vertice != adjacencias[vertice])
    return caminho(adjacencias[vertice]);
  else
    return vertice;
}

void preenche_adjacencia(int inicio, int fim) {
  adjacencias[caminho(inicio)] = caminho(fim);
}

void promessa_de_campanha() {
  int qtd_pontos, qtd_estradas;
  scanf("%d", &qtd_pontos);
  scanf("%d", &qtd_estradas);

  int i = 0;
  while (i < MAX) {
    adjacencias[i] = i;
    i += 1;
  }

  int inicio, fim;
  while (qtd_estradas > 0) {
    scanf("%d", &inicio);
    scanf("%d", &fim);
    preenche_adjacencia(inicio - 1, fim - 1);
    qtd_estradas -= 1;
  }

  std::set<int> estradas;

  int j = 0;
  while (j < qtd_pontos) {
    estradas.insert(caminho(j));
    j += 1;
  }

  if (estradas.size() != 1) {
    printf("ainda falta(m) %lu estrada(s)\n", estradas.size() - 1);
  } else {
    printf("a promessa foi cumprida\n");
  }
}
