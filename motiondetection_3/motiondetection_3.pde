import processing.video.*;

Capture video;
int y = 0;
int x = 0;

color[] randomColor = {#4deeea, #74ee15, #ffe700, #f000ff, #001eff};
int picker = 0;
int videoScale = 10;
int cols, rows;

int currentScreen = 0;
int count = 0;
int counter = 0;

void setup() {
    size(1280,720);
    background(255,255,255);
    
    // Initialize columns and rows
    cols = 1280; //width / videoScale;  
    rows = 720;  //height / videoScale;
      
    video = new Capture(this, cols, rows); //width, height
    video.start();
}

void draw() {
  if (video.available()) {
    video.read();
  }
  switch(currentScreen) {
    case 0: slitScan();break;
    case 1: neonPixels();break;
  }
  if (counter > 600) {
    currentScreen++;
    counter = 570;
    if (currentScreen > 1) { currentScreen = 0; counter = 0;}
  }
  counter++;
  println(" counter = ", counter);
}
