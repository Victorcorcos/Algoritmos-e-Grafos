#include <bits/stdc++.h>
#define MAX 30

int  adjacencias[MAX];
int  caminho(int vertice);
void preenche_adjacencia(int vertice1, int vertice2);
void lista(std::map<int, std::vector<int> > componentes_conexos);
void descobre_componentes_conexos();

int main() {
  int qtd_testes, i = 1;
  scanf("%d", &qtd_testes);
  while (i <= qtd_testes) {
    printf("Case #%d:\n", i);
    descobre_componentes_conexos();
    i += 1;
  }
  return 0;
}

int caminho(int vertice) {
  if (vertice != adjacencias[vertice])
    return adjacencias[vertice] = caminho(adjacencias[vertice]);
  else
    return vertice;
}

void preenche_adjacencia(int vertice1, int vertice2) {
  if (caminho(vertice1) <= caminho(vertice2))
    adjacencias[caminho(vertice2)] = caminho(vertice1);
  else
    adjacencias[caminho(vertice1)] = caminho(vertice2);
}

void lista(std::map<int, std::vector<int> > componentes_conexos) {
  for (auto &i : componentes_conexos) {
    for (auto &j : i.second) {
      printf("%c,", char(j + 'a'));
    }
    printf("\n");
  }
  printf("%lu connected components\n\n", componentes_conexos.size());
}

void descobre_componentes_conexos() {
  char vertice1, vertice2;
  int vertices, arestas;

  scanf("%d", &vertices);
  scanf("%d", &arestas);

  int i = 0;
  while (i < vertices) {
    adjacencias[i] = i;
    i += 1;
  }
  i = 0;
  while (i < arestas) {
    scanf(" %c", &vertice1);
    scanf(" %c", &vertice2);
    preenche_adjacencia(vertice1 - 'a', vertice2 - 'a');
    i += 1;
  }
  std::map<int, std::vector<int> > componentes_conexos;
  i = 0;
  while (i < vertices) {
    componentes_conexos[caminho(i)].emplace_back(i);
    i += 1;
  }

  lista(componentes_conexos);
}
