import processing.video.*;

Capture video;

int videoSliceX;
int drawPositionX;


void setup() {
  size(800, 600);
  
  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this,400, 600);

  videoSliceX = video.width / 2;
  drawPositionX = width - 1;
  background(0);
  
  // Start capturing the images from the camera
  video.start();  
  tint(255,0,0, 30);
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
      pixels[setPixelIndex] = video.pixels[getPixelIndex];
    }
    updatePixels();
    
    drawPositionX--;
    // Wrap the position back to the beginning if necessary.
    if (drawPositionX < 0) {
      drawPositionX = width - 1;
    }
  }
}
