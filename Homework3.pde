PImage[] imageTile= new PImage[8]; 
int[] imageTileX = new int[8];
int[] imageTileY = new int[8]; 
Boolean[] imageClicked = new Boolean[8];
Boolean[] imageSolved = new Boolean[8]; 
int[] imageSolution = new int[8]; 
int playerClick;
int playerYPos; 
int playerBox; 

void setup() {
  size(800,400); 
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

  playerClick=0; 

  for(int i=0; i<4; i++) {
    imageTileX[i]= i*200; 
    imageTileY[i]= 0; 
    imageTileX[i+4] = i*200;
    imageTileY[i+4] = 200; 
   
  };
  
  for(int i=0; i<8; i++) {     
    imageClicked[i]=false; 
    imageSolved[i]=false; 
  };
  

};


void draw() {
  imageMode(CORNER);
  stroke(255,255,255);
  strokeWeight(1); 
  
  for(int i=0; i<4; i++) {
    if (imageSolved[i]) {
      fill(0,0,255);
      rect((i*200), 0, 200, 200);
    } else if (!imageClicked[i]) {
      fill(0,0,0);
      rect((i*200), 0, 200, 200);
    } else {  
      image(imageTile[i], (i*200), 0, 200, 200);    
    };
    if (imageSolved[i+4]) {
      fill(0,0,255);
      rect((i*200), 200, 200, 200);
    } else if (!imageClicked[i+4]) {
      fill(0,0,0);
      rect((i*200), 200, 200, 200);
    } else {  
      image(imageTile[i+4], (i*200), 200, 200, 200);    
    };

  };
  
};

void mouseClicked() {
  playerClick++;
  if (playerClick==3){
     playerClick=0; 
       for(int i=0; i<8; i++) {     
          imageClicked[i]=false; 
     };
   } else { 
    if(mouseY<200) {
      playerYPos=0; 
    } else {
      playerYPos=4; 
    }; 
  
    playerBox = mouseX/200 + playerYPos; 

    imageClicked[playerBox]=true;
    
   }; 
  
  for(int i=0; i<8; i++){
    if(imageClicked[i]) {
      for(int j=0; j<8; j++){
        if(i!=j && imageClicked[j] && imageSolution[i]==imageSolution[j]) {
          imageSolved[i]=true; imageSolved[j]=true;
          
      };
    };
  }; 
 }; 
};

