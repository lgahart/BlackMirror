import processing.video.*;
import processing.sound.*;

Capture video;
SoundFile file;

int videoSliceX;
int drawPositionX;
PImage imgMask;


void setup() {
  size(800, 600);
  
  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this,400, 600);
  file = new SoundFile(this, "space.wav");
  file.play();

  videoSliceX = video.width / 2;
  drawPositionX = width - 1;
  background(0);
  tint(252,176,214, 30);
  video.start();  

  //imgMask = loadImage("neonbg.jpg");
  //video.mask(imgMask);
  
  
}




void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    // Copy a column of pixels from the middle of the video 
    // To a location moving slowly across the canvas.
    loadPixels();
    for (int y = 0; y < video.height; y++){
      int setPixelIndex = y*width + drawPositionX;
      int getPixelIndex = y*video.width  + videoSliceX;
      pixels[setPixelIndex] = video.pixels[getPixelIndex ];
    }
    updatePixels();
    
    drawPositionX--;
    // Wrap the position back to the beginning if necessary.
    if (drawPositionX < 0) {
      drawPositionX = width - 1;
    }
  }
}
