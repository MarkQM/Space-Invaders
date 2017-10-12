Invader[] invaderArray;
Cover[] coverArray;
Player player1;

int score;
int level;
int timeCounter;
int menuSelect;

int gameState;

boolean advancePhase;

PImage menu;
PImage overScreen;

void setup(){
  size(800,600);
  
  //menu = loadImage("menu.png");
  //overScreen = loadImage("gameOver.png");
  
  score = 0;
  level = 0;
  timeCounter = 0;
  menuSelect = 0;
  
  gameState = 1;
  advancePhase = false;
  
  invaderArray = new Invader[55];
  coverArray = new Cover[25];
  player1 = new Player();
  
  initializeCover();
  initializeInvaders();
}


void draw(){
  background(0);
  
  switch(gameState){
    
    case 0:
      drawMenu();
    
    case 1:
      manageInvaderInteraction();
      managePlayer();
    
      checkAdvance();
      checkGameOver();
      timeCounter++;
      break;
      
    case 2:
      gameOver();
  }
}

void manageInvaderInteraction(){
  if((invaderArray[0].xpos <= 30 || invaderArray[54].xpos >= width - 30) && timeCounter % 30 == 0){
    advancePhase = !advancePhase;
  }
  for(int i = 0; i < invaderArray.length; i++){
    manageInvaderMovement(invaderArray[i], advancePhase);
    manageInvaderProjectiles(invaderArray[i]);
    manageCollisions(invaderArray[i]);
  }
  manageInvaderFiring();
}


void manageInvaderMovement(Invader x, boolean advance){
  if(timeCounter % x.moveDelay == 0){
    if(advance){
        x.advance();
    }
    else{
      x.move();
    } 
  }
  x.display();
}

void manageInvaderProjectiles(Invader x){
  x.refreshProjectile();
  
  if(x.projectile.ypos > height){
      x.projectile.collide();
    }
    
    x.projectile.travel();
    x.projectile.display();
}

void manageCollisions(Invader x){
   if(abs(player1.bullet.xpos - x.xpos) < 16 &&
   abs(player1.bullet.ypos - x.ypos + 12) < 12 && x.active
   && player1.bullet.active){
     x.hit();
     player1.bullet.collide();
     score += 100;
   }
   
   if(abs(x.projectile.xpos - player1.xpos) < 20 + (x.projectile.size/2) &&
   abs(x.projectile.ypos - player1.ypos) < 10){
     player1.hit();
     x.projectile.collide();
   }
   
   for(int i = 0; i < coverArray.length; i++){
     if(abs(x.projectile.ypos - coverArray[i].ypos) < 20 &&
     abs(x.projectile.xpos - coverArray[i].xpos) < 20 && coverArray[i].active){
       coverArray[i].hit();
       x.projectile.collide();
     }
     
     if(abs(player1.bullet.xpos - coverArray[i].xpos) < 20 + (x.projectile.size/2) &&
     abs(player1.bullet.ypos - coverArray[i].ypos) < 20 && coverArray[i].active
     && player1.bullet.active){
       coverArray[i].hit();
       player1.bullet.collide();
     }
     coverArray[i].display();
   }
}

void managePlayer(){
  managePlayerProjectiles();
  player1.display();
}

void managePlayerProjectiles(){
    player1.refreshBullet(player1.bullet);
    player1.bullet.travel();
    player1.bullet.display();  
    if(player1.bullet.ypos < 0 || player1.bullet.ypos > height){
      player1.bullet.collide();
    }
}

void manageInvaderFiring(){
  
  for(int column = invaderArray.length-11; column < invaderArray.length; column++){
    checkFront(column);
  }
}

void checkFront(int i){
  if(invaderArray[i].active){
    randomFire(invaderArray[i]);
  }
  else if(i-11 >= 0){
    checkFront(i-11);
  }
}

void randomFire(Invader x){
  if(random(0,1) < x.aggression){
    x.fire();
  }
}

void initializeInvaders(){
  
  int xpos = 40;
  int ypos = 40;
  
   for(int i = 0; i < invaderArray.length; i++){
     
     if(i < 11){
       invaderArray[i] = new Invader(level+2, xpos + (i%11)*((width-(width/8))/11), ypos + 40);
     }
     else if(i < 22){
       invaderArray[i] = new Invader(level+1, xpos + (i%11)*((width-(width/8))/11), ypos + 80);
     }
     else if(i < 33){
       invaderArray[i] = new Invader(level+0, xpos + (i%11)*((width-(width/8))/11), ypos + 120);
     }
     else if(i < 44){
       invaderArray[i] = new Invader(level+0, xpos + (i%11)*((width-(width/8))/11), ypos + 160);
     }
     else{
       invaderArray[i] = new Invader(level+0, xpos + (i%11)*((width-(width/8))/11), ypos + 200);
     }
   }
}

void initializeCover(){
  
  int xpos = width/6;
  int ypos = height-160;
  
  for(int i = 0; i < coverArray.length; i++){
    if(i<5){
      coverArray[i] = new Cover(xpos + i*(width/6), ypos); 
    }
    else if(i < 10){
      coverArray[i] = new Cover(xpos - 20 + (i%5)*(width/6), ypos+20);
    }
    else if(i < 15){
      coverArray[i] = new Cover(xpos - 20 + (i%5)*(width/6), ypos+40);
    }
    else if(i < 20){
      coverArray[i] = new Cover(xpos +20 + (i%5)*(width/6), ypos+20);
    }
    else{
      coverArray[i] = new Cover(xpos + 20 + (i%5)*(width/6), ypos+40);
    }
  }
}


void checkAdvance(){
  for(int i = 0; i < invaderArray.length; i++){
    if(invaderArray[i].active){
      break;
    }
    if(i == (invaderArray.length)-1){
      nextLevel();
    }
  }
}
  
void nextLevel(){
  timeCounter = 0;
  advancePhase = false;
  level++;
  player1.lives++;
  score += 1000;
  initializeInvaders();
  System.gc();
}

void checkGameOver(){
  if(player1.lives < 1){
   gameState = 2; 
  }
}

void drawMenu(){
  
  image(menu, 0, 0);
  
}

void gameOver(){
  image(overScreen, 0, 0);
  text("Score: " + score, width/2, height/2);
}

void keyPressed(){
  switch(gameState){
    
    case 0:
      if(key == ' ' || keyCode == ENTER){
        gameState = 1;
      }
      break;
    
    case 1:
    if(keyCode == LEFT){
      player1.moveLeft();
    }
    
    if(keyCode == RIGHT){
      player1.moveRight();
    }
    
    if(key == ' '){
      player1.fire();
    }
    break;
    
    case 2:
    if(keyCode == ENTER || key == ' '){
      gameState = 0;
    }
    break;
  }
}