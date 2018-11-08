import processing.video.*;
Capture video;
void setup() {  
  fullScreen();
  tint(255, 255, 255, 30);
  video = new Capture(this, width, height);
  video.start();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {  
  image(video, 0 ,0);
}
