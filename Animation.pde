class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void displayAnimation(float xpos, float ypos) {
    if (imageCount-1 > frame){
      frame = (frame+1);
    }
      image(images[frame], xpos, ypos);
  }
  
  void resetAnimation(){
    frame = 0;    
  }
  
  
}