#include <iostream>
#include <cstdio>
 
int main() {
  unsigned total_digits, digits_to_erase;
 
  while (std::cin >> total_digits >> digits_to_erase, total_digits && digits_to_erase) {
    char entry[total_digits + 1];
    char output[total_digits + 1];
     
    std::cin.get();
    scanf("%s", entry);
 
    unsigned top = -1;
    unsigned position = 0;
 
    for (;digits_to_erase > 0;) {
      if (top == -1) {
        top += 1;
        output[top] = entry[position]; 
        position += 1;   
      }
 
      if (output[top] < entry[position]) {
        top -= 1;
        digits_to_erase -= 1;
        continue;
      }
 
      top += 1;
      output[top] = entry[position];
      position += 1;
 
      if (position == total_digits) {
        for (; digits_to_erase > 0; digits_to_erase -= 1, top -= 1);
      }
    }

    unsigned i = position;

    while (i < total_digits) {
      top += 1;
      output[top] = entry[i];
      i += 1;
    }

    output[top + 1] = '\0';
    std::cout << output << "\n";
  }
}
