public class CandyBoard {
  CandyPiece[][] gamestate;
  int cellsPerRow=10;
  int cellsPerColumn=10;
  boolean isActive = true;
  int topBorderOffset = (candyPieceSize*3)/2; //give gap of 1 candyPiece for header
  int leftBorderOffset = candyPieceSize/2; //line up pieces against left edge

  CandyBoard() {
    gamestate= new CandyPiece[cellsPerRow][cellsPerColumn];
    int xPos = leftBorderOffset;
    int yPos = topBorderOffset;
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        xPos = candyPieceSize*i+leftBorderOffset;
        yPos = candyPieceSize*j+topBorderOffset;
        gamestate[i][j] = new CandyPiece(xPos, yPos);
      }
    }
  }
  
  void removeMatches(){
    int currX;
    int currY;
   
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        currX = gamestate[i][j].xPos;
        currY = gamestate[i][j].yPos;
        
        //check right
        if(i<board.gamestate.length-2){
         if(gamestate[i][j].matches(gamestate[i+1][j])){
          if(gamestate[i][j].matches(gamestate[i+2][j])){
            gamestate[i+1][j] = new PlaceHolder(currX+candyPieceSize, currY);
            gamestate[i+2][j] = new PlaceHolder(currX+candyPieceSize*2, currY);
            if(i<board.gamestate.length-3){
              if(gamestate[i][j].matches(gamestate[i+3][j])){
                gamestate[i+3][j] = new PlaceHolder(currX+candyPieceSize*3, currY);
              }
            }
             if(i<board.gamestate.length-4){
              if(gamestate[i][j].matches(gamestate[i+4][j])){
                gamestate[i+4][j] = new PlaceHolder(currX+candyPieceSize*4, currY);
              }
            }
            gamestate[i][j]= new PlaceHolder(currX, currY);
          }
          }
        }
        //check down
        if(j<board.gamestate[i].length-3){
           if(gamestate[i][j].matches(gamestate[i][j+1])){
          if(gamestate[i][j].matches(gamestate[i][j+2])){
            gamestate[i][j+1] = new PlaceHolder(currX, currY+candyPieceSize);
            gamestate[i][j+2] = new PlaceHolder(currX, currY+candyPieceSize*2);
            if(j<board.gamestate[i].length-3){
              if(gamestate[i][j].matches(gamestate[i][j+3])){
                gamestate[i][j+3] = new PlaceHolder(currX, currY+candyPieceSize*3);
              }
            }
             if(i<board.gamestate[i].length-4){
              if(gamestate[i][j].matches(gamestate[i][j+4])){
                gamestate[i][j+4] = new PlaceHolder(currX, currY+candyPieceSize*4);
              }
            }
            gamestate[i][j]= new PlaceHolder(currX, currY);
          }
         }
        }
       }
      }
     }
     
  void update() {
    PlaceHolder temp;
    for (int i=gamestate.length-1; i>= 0; i--) {
      for (int j=gamestate[i].length-1; j>= 1; j--) {
        temp = new PlaceHolder(gamestate[i][j-1].xPos,gamestate[i][j-1].yPos);
        
        if(gamestate[i][j] instanceof PlaceHolder) {
           while(gamestate[i][j-1].yPos < gamestate[i][j].yPos) {
             gamestate[i][j-1].yPos++;
           }
           gamestate[i][j] = gamestate[i][j-1];
           gamestate[i][j-1] = temp;
        }
      }
    }
  }
  
  void dropNewPieces() {
     for (int i=gamestate.length-1; i>= 0; i--) {
       if(gamestate[i][0] instanceof PlaceHolder) {
         gamestate[i][0] = new CandyPiece(gamestate[i][0].xPos,gamestate[i][0].yPos);  
       }
     }
  }
}
