#include <assert.h>
#include "minesweeper.h"

int main(void) {
  char grid[100];
  struct posn mines[7];
  struct ms_board b = {10, 10, grid, 7, mines};
  int len = (b.width * b.height);
  for (int i = 0; i < len; ++i) {
    b.board[i] = ' ';
  }
  b.mines[0].x = 3;   // __|_A__B__C__D__E__F__G__H__I__J_
  b.mines[0].y = 1;   //  1|       M                      
  b.mines[1].x = 2;   //  2|    M                         
  b.mines[1].y = 2;   //  3|                         M    
  b.mines[2].x = 9;   //  4|          M  M                
  b.mines[2].y = 3;   //  5|                   M          
  b.mines[3].x = 10;  //  6|                              
  b.mines[3].y = 10;  //  7|                              
  b.mines[4].x = 7;   //  8|                              
  b.mines[4].y = 5;   //  9|                              
  b.mines[5].x = 4;   // 10|                         1 M  
  b.mines[5].y = 4;
  b.mines[6].x = 5;  // The above is a diagram of the position of mines on the
  b.mines[6].y = 4;  // board, including the code revealing I-10 on line 27

  b.board[98] = '1';

  assert(reveal(&b, 10, 10));
  assert(b.board[99] == '*');

  assert(!reveal(&b, 10, 10));
  assert(b.board[99] == '*');
}