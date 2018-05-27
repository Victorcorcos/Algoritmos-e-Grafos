#include <bits/stdc++.h>
#define debug(x) cout << #x " = " << (x) << endl
#define endl '\n'

using namespace std;

const int MN = 1000 * 1000 + 10;

int main() {
  ios_base::sync_with_stdio(false);cin.tie(NULL);
  int tc; cin >> tc;
  while (tc--) {
    int number_of_items;
    int min_distance;

    cin >> number_of_items >> min_distance;

    vector<int> memo(MN), aux(MN), values(MN);
    vector<int> positions(number_of_items);

    for (int i = 0; i < number_of_items; ++i) {
      cin >> positions[i];
      aux[positions[i]] = 1;
    }

    for (int i = 0; i < number_of_items; ++i) {
      int current_value;
      cin >> current_value;
      values[positions[i]] = max(values[positions[i]], current_value);
    }

    for (int i = MN - 2; i >= 0; --i) {
      memo[i] = memo[i + 1];
      if (aux[i] && (i + min_distance < MN))
        cout << "aux[i]: " << aux[i] << ". memo[i]: " << memo[i] << ". values[i]: " << values[i] << ". ";
        memo[i] = max(memo[i], values[i] + memo[i + min_distance]);
    }

    cout << memo[0] << endl;
  }

  return 0;
}
