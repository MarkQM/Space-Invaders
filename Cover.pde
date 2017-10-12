class Cover{
  boolean active;
  
  int health;
  int xpos;
  int ypos;
  int size;
  
  PImage sprite0;
  PImage sprite1;
  PImage sprite2;
  PImage sprite3;
  
  Cover(int xpos, int ypos){
    this.xpos = xpos;
    this.ypos = ypos;
    
    health = 3;
    size = 20;
    active = true;
  }
  
  void hit(){
    health--;
    if(health < 0){
      disable();
    }
  }
  
  void disable(){
    active = false;
  }
  
  void display(){
    if(active){
      switch(health){
      
        case 3:
       // image(sprite3, xpos, ypos);
        fill(70);
        rect(xpos-(size/2), ypos-(size/2), size, size);
        break;
        
        case 2:
      //  image(sprite2, xpos, ypos);
        fill(50);
        rect(xpos-(size/2), (ypos-size/2), size, size);
        break;
        
        case 1:
     //   image(sprite1, xpos, ypos);
        fill(30);
        rect(xpos-(size/2), ypos-(size/2), size, size);
        break;
        
        case 0:
      //  image(sprite0, xpos, ypos);
        fill(20);
        rect(xpos-(size/2), ypos-(size/2), size, size);
        break;
    }
   }
  }
}