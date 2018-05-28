#include <iostream>
#include <vector>
using namespace std;

class Coordinate
{
public:
  int x, y;
  bool visited;
};

int winner;

void search(vector<vector <int> > maze, vector<vector <Coordinate> > coordinates, int i, int j)
{
  if(i >= 0 && i < 5 && j >= 0 && j < 5 && !winner)
  {
    coordinates[i][j].visited = true;
    if(i == 4 && j == 4)
      winner = 1;
    else
    {
      if(i + 1 < 5 && maze[i + 1][j] == 0 && !coordinates[i + 1][j].visited)
        search(maze, coordinates, i + 1, j);
      if(i - 1 >= 0 && maze[i - 1][j] == 0 && !coordinates[i - 1][j].visited)
        search(maze, coordinates, i - 1, j);
      if(j + 1 < 5 && maze[i][j + 1] == 0 && !coordinates[i][j + 1].visited)
        search(maze, coordinates, i, j + 1);
      if(j - 1 >= 0 && maze[i][j - 1] == 0 && !coordinates[i][j - 1].visited)
        search(maze, coordinates, i, j - 1);
    }
  }
}

int main(int argc, char *argv[])
{
  int T;

  cin >> T;

  for(int i = 0; i < T; i++)
  {
    vector<vector <int> > maze(5);
    vector<vector <Coordinate> > coordinates(5);
    for(int j = 0; j < 5; j++)
    {
      maze[j].resize(5);
      coordinates[j].resize(5);
    }
    for(int j = 0; j < 5; j++)
    {
      for(int k = 0; k < 5; k++)
      {
        int e;
        cin >> e;
        maze[j][k] = e;

        coordinates[j][k].x = j;
        coordinates[j][k].y = k;
        coordinates[j][k].visited = false;
      }
    }
    winner = 0;
    search(maze, coordinates, 0, 0);
    if(winner)
      cout << "COPS\n";
    else
      cout << "ROBBERS\n";
  }

  return 0;
}