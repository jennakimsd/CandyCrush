int candyPieceSize;
int score=0;
int lives=3;
int movesRemaining=20;
int lastClickedX= 0;
int lastClickedY = 0;
final int MENU_STATE=0;
final int GAME_STATE=1;
final int END_STATE=2;
int currentState = MENU_STATE;
public static CandyBoard board;

void initiate() {
  if (currentState==MENU_STATE) {
    System.out.println("use your mouse to select the piece you want to move and use the up, down, left, and right keys to indicate which way you want the piece to move");
  }
}
void setup() {
  size(500, 550);
  background(#D1F2FF);
  candyPieceSize = width/10;
  board = new CandyBoard();
  board.removeMatches();
}

void draw() {
  background(#E8FDFF);
  drawBoard();
  //board.removeMatches();
  //board.update();
  fill(0,0,0);
  textSize(18);
  textAlign(LEFT,BOTTOM);
  text("Score: " + score, 30, 35);
  text("Moves Remaining: " + movesRemaining, 150, 35);
  text("Lives: " + lives, 390, 35);
} 

void mousePressed() {
  //divide by 100 to change from pixels to indexes
  lastClickedX = mouseX/candyPieceSize;
  lastClickedY = (mouseY/candyPieceSize) - 1;
}
void keyPressed() {
   if (key == 'r' || key == 'R') {
    board.removeMatches();
    movesRemaining--;
    score+=5;
  }
     
  if (key == 'c' || key == 'C') {
      board.update();
      board.dropNewPieces();
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
     board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX][lastClickedY-1]);
    } else if (keyCode == DOWN) {
        board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX][lastClickedY+1]);
    } else if (keyCode==RIGHT) {
       board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX+1][lastClickedY]);
    } else {
        board.gamestate[lastClickedX][lastClickedY].swapColors(board.gamestate[lastClickedX-1][lastClickedY]); 
    }
  }
}
void drawBoard() {
  for (int i=0; i< board.gamestate.length; i++) {
    for (int j=0; j<board.gamestate[i].length; j++) {
      CandyPiece temp = board.gamestate[i][j];
      fill(temp.colorr);
      ellipse(temp.xPos, temp.yPos, candyPieceSize - 15, candyPieceSize - 15);
    }
  }
}
