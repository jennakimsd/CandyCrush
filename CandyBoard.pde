public class CandyBoard {
  CandyPiece[][] gamestate;
  int cellsPerRow=10;
  int cellsPerColumn=10;
  int xPos = 50;
  int yPos = 50;
  int candySpacing = 75;
  boolean isActive = true;

  CandyBoard() {
    gamestate= new CandyPiece[cellsPerRow][cellsPerColumn];
    for (int i=0; i< gamestate.length; i++) {
      for (int j=0; j<gamestate[i].length; j++) {
        gamestate[i][j] = new CandyPiece(xPos, yPos);
        yPos+=candySpacing;
      }
      yPos=50;
      xPos+=candySpacing;
    }
  }
  
  CandyPiece[][] removeMatches(CandyPiece[][] gamestateCopy){
    int xCopy;
    int yCopy;
   
    for (int i=0; i< gamestateCopy.length; i++) {
      for (int j=0; j<gamestateCopy[i].length; j++) {
        xCopy = candySpacing*i+gamestateCopy[i][j].pieceWidth;
        yCopy = candySpacing*j+gamestateCopy[i][j].pieceWidth;
        
        //check right
        if(i<board.gamestate.length-2){
         if(gamestateCopy[i][j].matches(gamestateCopy[i+1][j])){
          if(gamestateCopy[i][j].matches(gamestateCopy[i+2][j])){
            gamestateCopy[i+1][j] = new PlaceHolder(xCopy+gamestateCopy[i][j+4].pieceWidth, yCopy);
            gamestateCopy[i+2][j] = new PlaceHolder(xCopy+gamestateCopy[i+2][j].pieceWidth*2, yCopy);
            println(gamestateCopy[i+1][j].pieceWidth);
            if(i<board.gamestate.length-3){
              if(gamestateCopy[i][j].matches(gamestateCopy[i+3][j])){
                gamestateCopy[i+3][j] = new PlaceHolder(xCopy+gamestateCopy[i+3][j].pieceWidth*3, yCopy);
              }
            }
             if(i<board.gamestate.length-4){
              if(gamestateCopy[i][j].matches(gamestateCopy[i+4][j])){
                gamestateCopy[i+4][j] = new PlaceHolder(xCopy+gamestateCopy[i+4][j].pieceWidth*4, yCopy);
              }
            }
            gamestateCopy[i][j]= new PlaceHolder(xCopy, yCopy);
          }
          }
        }
        //check down
        if(j<board.gamestate[i].length-3){
           if(gamestateCopy[i][j].matches(gamestateCopy[i][j+1])){
            if(gamestateCopy[i][j].matches(gamestateCopy[i][j+2])){
              gamestateCopy[i][j+1] = new PlaceHolder(xCopy, yCopy+gamestateCopy[i][j+1].pieceWidth);
              gamestateCopy[i][j+2] = new PlaceHolder(xCopy, yCopy+gamestateCopy[i][j+2].pieceWidth*2);
               if(j<board.gamestate[i].length-3){
              if(gamestateCopy[i][j].matches(gamestateCopy[i][j+3])){
                gamestateCopy[i][j+3] = new PlaceHolder(xCopy, yCopy+gamestateCopy[i][j+3].pieceWidth*3);
              }
            }
              if(i<board.gamestate[i].length-4){
              if(gamestateCopy[i][j].matches(gamestateCopy[i][j+4])){
                gamestateCopy[i][j+4] = new PlaceHolder(xCopy, yCopy+gamestateCopy[i][j+4].pieceWidth*4);
              }
            }
            gamestateCopy[i][j]= new PlaceHolder(xCopy, yCopy);
            }
          }
        }

      }
    }
    return gamestateCopy;
      }
    }
