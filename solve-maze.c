/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from the following sources:

// None

// Name: Fayaz Ahmed
// login ID: f66ahmed
/////////////////////////////////////////////////////////////////////////////

#include "cs136-trace.h"
#include "maze.h"
#include <assert.h>

// turn_left(*face) changes the direction being faced to the left
// requires: *face is a valid pointer
void turn_left(int *face){
  assert(face);
  
  if(*face == DOWN){
    *face = RIGHT;
  } else if(*face == RIGHT){
    *face = UP;
  } else if(*face == UP){
    *face = LEFT;
  } else if(*face == LEFT){
    *face = DOWN;
  }
}

// turn_right(*face) changes the direction being faced to the right
// requires: *face is a valid pointer
void turn_right(int *face){
  assert(face);
  
  turn_left(face);
  turn_left(face);
  turn_left(face);
}

// right_side(face, *right_hand)
//   changes right_hand to be the direction to the right of
//   the direction faced
// requires: face = UP, DOWN, LEFT, or RIGHT
//           *right_hand is a valid pointer
void right_side(int face, int *right_hand){
  assert(right_hand);
  
  if(face == DOWN){
    *right_hand = LEFT;
  } else if (face == RIGHT){
    *right_hand = DOWN;
  } else if (face == UP){
    *right_hand = RIGHT;
  } else if (face == LEFT){
    *right_hand = UP;
  }
}

// Takes a maze as input and uses the right hand method to
// output a solution
int main(void) {
  struct maze *m = read_maze();
  int face = DOWN;
  int right_hand = LEFT;
  
  while(1){
    if(is_wall(m, right_hand)){
      while(is_wall(m, face)){
        turn_left(&face);
        right_side(face, &right_hand);
      }
    } else {
      turn_right(&face);
      right_side(face, &right_hand);
    }
    move(m, face);
  }
}
