#include "minesweeper.h"

//////////////////////////////////////
// DO NOT CHANGE THESE CONSTANTS:
const char UNREVEALED = ' ' ;
const char REVEALED[9] = "012345678";
const char FLAG = 'F';
const char MINE = '*';
//////////////////////////////////////


bool is_mine(struct ms_board *b, int x, int y){
  for(int i = 0; i < b->num_mines; i++){
    if(b->mines[i].x == x && b->mines[i].y == y){
      return true;
    }
  }
  return false;
}  

bool flag(struct ms_board *b, int x, int y) {
  if(b->board[(y-1) * b->width + x - 1] == UNREVEALED){
    b->board[(y-1) * b->width + x - 1] = FLAG;
    return true;
  } else if(b->board[(y-1) * b->width + x - 1] == FLAG){
    b->board[(y-1) * b->width + x - 1] = UNREVEALED;
    return true;
  }
  return false;
}

bool reveal(struct ms_board *b, int x, int y) {
  if(b->board[(y-1) * b->width + x - 1] != UNREVEALED){
    return false;
  }
  if(is_mine(b, x, y)){
    b->board[(y-1) * b->width + x - 1] = MINE;
    return false;
  }
   
  int adj_mine = 0;
  
  for(int i = -1; i <= 1; i++){
    for(int j = -1; j <= 1; j++){
      int s = x + i;
      int t = y + j;
      
      if((s > 0) &&
         (s <= b->width) &&
         (t > 0) &&
         (t <= b->height)){
        if(is_mine(b, s, t)){
          adj_mine++;
        }
      }
    }
  }
  
  b->board[(y-1) * b->width + x - 1] = REVEALED[adj_mine];
  
  if(adj_mine == 0){
    for(int i = -1; i <= 1; i++){
      for(int j = -1; j <= 1; j++){
        int s = x + i;
        int t = y + j;
        if((s > 0) &&
           (s <= b->width) &&
           (t > 0) &&
           (t <= b->height) &&
           b->board[(t - 1) * b->width + s - 1] == UNREVEALED){
          reveal(b, s, t);
        }
      }
    }
  }
  
  return true;
}

bool game_won(const struct ms_board *b) {
  int unrev = 0;
  
  for(int i = 0; i < b->width; i++){
    for(int j = 0; j < b->height; j++){
      if(b->board[j * b->width + i] == MINE){
        return false;
      }
      if(b->board[j * b->width + i] == UNREVEALED ||
         b->board[j * b->width + i] == FLAG){
        unrev++;
      }
    }
  }
        
  if(unrev == b->num_mines){
    return true;
  }
  
  return false;
}

bool game_lost(const struct ms_board *b) {
  for(int i = 0; i < b->width; i++){
    for(int j = 0; j < b->height; j++){
      if(b->board[j * b->width + i] == MINE){
        return true;
      }
    }
  }
      
  return false;
}

