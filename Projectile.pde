class Projectile{
  
  int xpos;
  int ypos;
  int size;
  int direction;
  int speed;
  
  boolean active;
  
  //PImage sprite0 = loadImage("projectile0.png");
  //PImage sprite1 = loadImage("projectile1.png");
  //PImage sprite2 = loadImage("projectile2.png");
  //PImage sprite3 = loadImage("projectile0.png");
  //PImage sprite4 = loadImage("projectile0.png");
  //PImage sprite5 = loadImage("projectile0.png");
  
  PImage sprite;
  
  Projectile(int type, int xpos, int ypos, int direction){

    this.xpos = xpos;
    this.ypos = ypos;
    
    this.direction = direction;
    
    active = false;
    
    switch(type){
      
      case 0:
      //sprite = sprite0;
      speed = 3;
      size = 3;
      break;
      
      case 1:
      //sprite = sprite1;
      speed = 5;
      size = 10;
      break;
      
      case 2:
      //sprite = sprite2;
      speed = 8;
      size = 5;
      break;
      
      case 3:
      //sprite = sprite3;
      speed = 10;
      size = 8;
      break;
      
      case 4:
      //sprite = sprite4;
      speed = 2;
      size = 30;
      break;
      
      case 5:
      //sprite = sprite5;
      speed = 10;
      size = 15;
      break;
      
      case -1:
      //sprite = sprite0;
      speed = 20;
      size = 3;
      break;
    }
  }
  
  void fire(){
    this.active = true;
  }
  
  void travel(){
    if(active){
      ypos += speed * direction;
    }
  }
  
  void display(){
    if(active){
      //image(sprite, xpos-(size/2), ypos);
      rect(xpos-(size/2), ypos, size, 30);
    }
  }
  
  void collide(){
    active = false;
  }
  
}