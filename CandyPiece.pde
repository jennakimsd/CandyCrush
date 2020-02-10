public class CandyPiece {
  //CandyPiece candy = new CandyPiece("red", locX, locY);
  int colorr;
  int xPos;
  int yPos;
  int pieceWidth = 50;

  CandyPiece(int x, int y) {
    this.xPos = x;
    this.yPos = y;
    chooseRandomColor();
  }

  boolean matches(CandyPiece piece) {
    if (colorr==piece.colorr) {
      return true;
    } else {
      return false;
    }
  }

  void chooseRandomColor() {
    int random = (int)random(5);
    if (random==0) {
      colorr = #FF0000;
    }
    if (random==1) {
      colorr = #0063FF;
    }
    if (random == 2) {
      colorr = #B600FF;
    }
    if (random == 3) {
      colorr = #00FF1F;
    }
    if (random == 4) {
      colorr = #FFAA00;
    }
  }

  void swapColors(CandyPiece p2){
    int temp = p2.colorr;
    p2.colorr = this.colorr;
    this.colorr=temp;
  }
  

}
