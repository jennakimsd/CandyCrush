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
  size(1000, 1000);
  board = new CandyBoard();
  background(#F2F2F2);
  board.removeMatches(board.gamestate);
}

void draw() {
  drawBoard();
} 

void mousePressed() {
  //divide by 100 to change from pixels to indexes
  lastClickedX = mouseX/100;
  lastClickedY =  mouseY/100;
}
void keyPressed() {
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
    
    board.removeMatches(board.gamestate);
  }
}
void drawBoard() {
  for (int i=0; i< board.gamestate.length; i++) {
    for (int j=0; j<board.gamestate[i].length; j++) {
      CandyPiece temp = board.gamestate[i][j];
      fill(temp.colorr);
      ellipse(temp.xPos, temp.yPos, temp.pieceWidth, temp.pieceWidth);
    }
  }
}
