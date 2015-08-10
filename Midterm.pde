PImage[] imageTile= new PImage[8]; 
int[] imageTileX = new int[8];
int[] imageTileY = new int[8]; 
Boolean[] imageClicked = new Boolean[8];
Boolean[] imageSolved = new Boolean[8]; 
int[] imageSolution = new int[8]; 
//determining player click 
int playerYPos; 
int playerBox; 
// pause elements 
Boolean playerClick; 
int playerClickCount;
int clickTime;
int clickDelay = 1000;
Boolean drawDone = false;
//scoring elements 
int topBarPad = 50; 
int playerScore;
int displayPlayerScore; 
int movePenalty = -3; 
int matchScore = 30; 
int runningClicks; 
int clickWeight; 
 

void setup() {
  size(800,400+topBarPad); 
  imageTile[0] = loadImage("Cmarmoreus-Scott&JeanetteJohnson-12.jpg");
  imageSolution[0] = 0; 
  imageTile[1] = loadImage("cone-snail.jpg"); 
  imageSolution[1] = 1;
  imageTile[2] = loadImage("Cmarmoreus-Scott&JeanetteJohnson-12.jpg"); 
  imageSolution[2] = 0;
  imageTile[3] = loadImage("Conus-geographicus.jpg"); 
  imageSolution[3] = 2;
  imageTile[4] = loadImage("slowsnailsfa.jpg"); 
  imageSolution[4] = 3;
  imageTile[5] = loadImage("Conus-geographicus.jpg"); 
  imageSolution[5] = 2;
  imageTile[6] = loadImage("cone-snail.jpg"); 
  imageSolution[6] = 1;
  imageTile[7] = loadImage("slowsnailsfa.jpg");
  imageSolution[7] =  3;

  playerClickCount=0;
  playerClick = false; 
  clickTime = 0; 
  playerScore  = 0; 

  //set parameters for determining where images are 
  for(int i=0; i<4; i++) {
    imageTileX[i]= i*200; 
    imageTileY[i]= topBarPad; 
    imageTileX[i+4] = i*200;
    imageTileY[i+4] = 200 + topBarPad; 
   
  };
  
  //set every image to unclicked 
  for(int i=0; i<8; i++) {     
    imageClicked[i]=false; 
    imageSolved[i]=false; 
  };
  

};


void draw() {
  imageMode(CORNER);
  stroke(255,255,255);
  strokeWeight(1); 
  int currentTime = millis();
 // draw interface  
  playerScore = runningClicks * movePenalty; 
  for(int i=0; i<8; i++) {
    if (imageSolved[i]) {
    playerScore += matchScore;
    };
  };
  if(playerScore<0) {
      displayPlayerScore=0;
  } else {
    displayPlayerScore = playerScore;
  };
  fill(0,0,255);
  rect(0,0, 800, topBarPad);
  fill(255);
  textSize(24); 
  text ("Cone Snail Match!", 10, topBarPad-15);
  text("Score: "+ displayPlayerScore, 650, topBarPad-15); 
  
  if (!drawDone) { //check to see if the board has been drawn for the last click 
  
    //draw the top row of board, checking solved, then not clicked, then clicked  
    for(int i=0; i<4; i++) {
      if (imageSolved[i]) {
        fill(0,0,255);
        rect((i*200), topBarPad, 200, 200);
      } else if (!imageClicked[i]) {
        fill(0,0,0);
        rect((i*200), topBarPad, 200, 200);
      } else {  
        image(imageTile[i], (i*200), topBarPad, 200, 200);    
      }; // draw the bottom row, as above 
      if (imageSolved[i+4]) {
        fill(0,0,255);
        rect((i*200), 200+topBarPad, 200, 200);
      } else if (!imageClicked[i+4]) {
        fill(0,0,0);
        rect((i*200), 200+topBarPad, 200, 200);
      } else {  
        image(imageTile[i+4], (i*200), 200+topBarPad, 200, 200);    
      };
    };
    
   } else {
       // reset player clicks and unsolved images
    if (playerClickCount==2){
      playerClickCount=0; 
      // check for solved images now
      for(int i=0; i<8; i++){
        if(imageClicked[i]) {
          for(int j=0; j<8; j++){
            if(i!=j && imageClicked[j] && imageSolution[i]==imageSolution[j]) {
              imageSolved[i]=true; imageSolved[j]=true;
            };      
          };    
        };
      }; // reset unclicked images for unsolved 
       for(int i=0; i<8; i++) {     
          imageClicked[i]=false; 
          println("Image" + i + "is not false"); 
     };
    };
  };
   
   // check to see if player action can be reset
   if((clickTime+clickDelay) < currentTime) {
     drawDone = false; 
     playerClick = false;
     
   } else {
     drawDone = true; 
  };
};

void mouseClicked() {
    //check to see if player can act 
    if(!playerClick) {
      playerClickCount++; runningClicks++;//increment click count 
      //find which bok the player clicked on 
      if((mouseY-topBarPad)<200) {
          playerYPos=0; 
        } else {
          playerYPos=4; 
        }; 
      
        playerBox = mouseX/200 + playerYPos; 
    
        imageClicked[playerBox]=true;
        
      // track player click  
                    
      playerClick = true; 
      clickTime = millis();
      println(clickTime); 

  }; 
}; 


