import processing.video.*;

Capture video;
int y = 0;
int x = 0;
//PImage img;                                       



void setup() {
    //open file in fullscreen
    fullScreen();
    background(255,255,255);
    //img = loadImage("neon.png");
    video = new Capture(this, width, height);
    tint(255,0,0,30);
    video.start();
}
void captureEvent(Capture video){
  video.read();
  tint(0, 153, 204);
}


void draw() {
   loadPixels(); 
   
   video.loadPixels();
   //img.loadPixels();
   
   int w = video.width;
   int h = video.height;

   copy(video, 0, h/2, w, 2, 0, y, w, 2);
   copy(video, w/2, 0, 2, h, x, 0, 2, h);

   y = y + 1;
   x = x + 1;
  
    if (y > height) {
    y = 0;
    }
    
    if (x > width) {
    x = 0;
    }
  }
