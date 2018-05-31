#include <iostream>
#include <array>

using namespace std;

const int MAXIMUM = 100001;

int values[MAXIMUM];
int relativeDistances[MAXIMUM];

int main() {
  int testCases;
  cin >> testCases;
  while (testCases--) {
    int radarsQuantity, minDistance, i, j, maximumRadar = 0;
    cin >> radarsQuantity >> minDistance;
    int radar[radarsQuantity];

    std::fill_n(values, MAXIMUM, 0);
    std::fill_n(relativeDistances, MAXIMUM, 0);

    for (i=0; i < radarsQuantity; i++) {
      cin >> radar[i];
      if (radar[i] > maximumRadar)
        maximumRadar = radar[i];
    }
    
    for (i=0; i < radarsQuantity; i++) {
      int newValue;
      cin >> newValue;
      if (newValue > values[radar[i]])
        values[radar[i]] = newValue;
    }

    maximumRadar += (minDistance+1);
    for (i=maximumRadar; i; i--) {
          relativeDistances[i-1] = relativeDistances[i];
          if (values[i-1] && ((relativeDistances[i-1+minDistance] + values[i-1]) > relativeDistances[i-1]))
            relativeDistances[i-1] = relativeDistances[i-1+minDistance] + values[i-1];
      }

      cout << relativeDistances[0] << endl;
  }

  return 0;
}
