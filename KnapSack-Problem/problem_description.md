## Algoritmo feito para resolver o problema chamado “Help Vânia”
## Disponível no URI (Online Judge PROBLEMS & CONTESTS) => https://www.urionlinejudge.com.br/judge/en/problems/view/2498

# Problem description

Rangel is a computer engineering student who likes to study for programming competitions and read books in his free time (when he’s not busy with all the college work). Besides liking to read Cormen’s and Halim’s books, he’s a great fiction fan. Knowing that, his friend Vânia decided to lend him some of the books from her collection so he can read them during vacation.

Each i-th book has a weight wi and vi which represents the probable degree of interest that Rangel has on the book. If it was up to her, she would lend all her books, but that is impossible given that her bag cannot fit all the books (which are many).

Given the number of books on her shelf, the maximum load supported by her bag and the weight and degree of interest in each one of the books, Vânia is asking for your help to write a program that helps her to choose the books in a way that maximizes the Rangel’s probable interest for the books. She could do this herself, but she’s very busy with her finals.

### Input
The entry contains several test cases. Each test starts with two values N (1 ≤ N ≤ 1000) and C (1 ≤ C ≤ 50) which represent the number of books available on Vânia’s shelf and the capacity of her bag, respectively. Each one of the next N lines will have two integers W (1 ≤ W ≤ C) and V (1 ≤ V ≤ 1000) which represent, respectively, the weight of each book and Rangel’s degree of interest in the book. The end of the entry is determined by N = C = 0.

### Output
For each test case your program must print a line with the following format: Caso H: M where H is an integer indicating the number of the test case and M is the maximum degree of interest of Rangel for the books.
