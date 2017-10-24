class Invader{
  int xpos;
  int ypos;
  int dirc;
  int size;
  
  PImage sprite0 = loadImage("invader0.png");
  PImage sprite1 = loadImage("invader1.png");
  PImage sprite2 = loadImage("invader2.png");
  PImage sprite3 = loadImage("invader3.png");
  PImage sprite4 = loadImage("invader4.png");
  PImage sprite5 = loadImage("invader5.png");

  
  float aggression;
  float speed;
  int moveDelay;
  
  PImage sprite;
  Projectile projectile;

  boolean active;
  
  
  Invader(int type, int xpos, int ypos){
    
    if(type > 5){
      type = 5;
    }
    
    this.xpos = xpos;
    this.ypos = ypos;
    this.projectile = new Projectile(type, xpos, ypos, 1);
    this.dirc = 1;
    
    active = true;
    
    switch(type){
      case 0:
      sprite = sprite0;
      aggression = 0.001;
      speed = 10;
      size = 32;
      moveDelay = 30;
      break;
      
      case 1:
      sprite = sprite1;
      aggression = 0.003;
      speed = 10;
      size = 32;
      moveDelay = 30;
      break;
      
      case 2:
      sprite = sprite2;
      aggression = 0.005;
      speed = 10;
      size = 32;
      moveDelay = 30;
      break;
      
      
      case 3:
      sprite = sprite3;
      aggression = 0.007;
      speed = 10;
      size = 32;
      moveDelay = 30;
      break;
      
      case 4:
      sprite = sprite4;
      aggression = 0.01;
      speed = 10;
      size = 32;
      moveDelay = 30;
      break;
      
      case 5:
      sprite = sprite5;
      aggression = 0.015;
      speed = 10;
      size = 32;
      moveDelay = 30;
    }
    
    
  }
  
  void fire(){
    if(!this.projectile.active){
      this.projectile.active = true;
      
    }
  }
    
  void refreshProjectile(){
    if(!projectile.active){
       projectile.xpos = this.xpos;
       projectile.ypos = this.ypos;
    }
  }
    
  
  void move(){
    xpos += speed * dirc;
  }
  
  void advance(){
    ypos += height/40;
    dirc = -dirc;
  }
  
  void display(){
    if(active){
      image(sprite, xpos, ypos);
      //fill(80,0,0);
      //rect(xpos-(size/2), ypos-12, size, 24);
      //fill(100);
      
    }
  }
  
  void hit(){
    active = false;
  }
  
}