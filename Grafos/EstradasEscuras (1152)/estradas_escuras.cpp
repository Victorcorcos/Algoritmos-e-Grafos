#include <bits/stdc++.h>
#define MN 200000

using namespace std;

int caminho(int vertice);
int preenche_adjacencia(int vertice1, int vertice2);
int nao_preenche_adjacencia(int vertice1, int vertice2);
int adjacencias[MN];
struct aresta {
  int vertice1;
  int vertice2;
  unsigned long metros;
  bool operator < (const aresta &objeto) const {
    return metros < objeto.metros;
  }
};

int main() {
  int juncoes;
  int estradas;
  while (cin >> juncoes >> estradas && (juncoes + estradas)) {
    vector<aresta> byteland(estradas);
    for (auto &aresta : byteland) {
      scanf("%d", &aresta.vertice1);
      scanf("%d", &aresta.vertice2);
      scanf("%lu", &aresta.metros);
    }
    int i = 0;
    while (i < juncoes) {
      adjacencias[i] = i;
      i += 1;
    }
    sort(byteland.begin(), byteland.end());
    unsigned long ans = 0;
    for (auto &aresta : byteland) {
      if (nao_preenche_adjacencia(aresta.vertice2, aresta.vertice1)) {
        ans += aresta.metros;
      }
    }
    printf("%lu\n", ans);
  }
  return 0;
}

int caminho(int vertice) {
  if (vertice != adjacencias[vertice])
    return adjacencias[vertice] = caminho(adjacencias[vertice]);
  else
    return vertice;
}

int preenche_adjacencia(int vertice1, int vertice2) {
  if (caminho(vertice1) != caminho(vertice2)) {
    adjacencias[caminho(vertice1)] = caminho(vertice2);
    return true;
  } else {
    return false;
  }
}

int nao_preenche_adjacencia(int vertice1, int vertice2) {
  return !preenche_adjacencia(vertice2, vertice1);
}
