class Player{
  
  Projectile bullet;
  
  int lives;
  int xpos;
  int ypos;
  
  PImage sprite;
  
  Player(){
    xpos = width/2;
    ypos = height-30;
    lives = 3;
    bullet = new Projectile(-1, xpos, 30, -1);
    
    sprite = loadImage("player.gif");
    
    
  }
  
  void refreshBullet(Projectile bullet){
    if(bullet.active == false){
       bullet.xpos = this.xpos;
       bullet.ypos = this.ypos;
    }
  }
  
  void fire(){{
    if(!bullet.active){
        refreshBullet(bullet);
        bullet.fire();
      }
    }
  }
  
  void moveLeft(){
    if(xpos > 30){
      xpos -= 15;
    }
  }
  
  void moveRight(){
    if(xpos < width - 30){
      xpos += 15;
    }
  }
  
  void hit(){
    lives--;
  }
  
  void display(){
    //image(sprite, xpos, ypos);
    rect(xpos-20, ypos, 40, 20);
  }
  
}