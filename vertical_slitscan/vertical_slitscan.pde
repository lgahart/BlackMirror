//Simple Vertical Slit-Scan Program
//Written for Processing Version 1.5.1
//Tyler Paige, September 2012
//Based off Golan Levin's "Simple Real-Time Slit-Scan Program"


import processing.video.*; //This slitscan uses live video from your webcam
Capture video;


int video_width     = 800; //Adjust this to change canvas width
int video_height    = 600; //Adjust this to change canvas height
int window_width    = video_width; 
int window_height   = video_height; 

boolean b_newFrame  = false;  // fresh-frame flag

void setup(){  
  size(800, 600);
  video = new Capture(this, 800, 600); //Get the live camera feed
  background(0,0,0); //Black background
  video.start(); 
  tint(255,0,0, 30);
}

public void captureEvent(Capture c) {
  c.read();
  b_newFrame = true;
}

void draw() {
  if (b_newFrame) { //For every frame of live video
    loadPixels(); 
    int slice_mask = (width*height/2)-width; //Subtracts everything above the middle row of pixels from the selection
    for (int i = slice_mask; i < (width*height)/2; i++) { //For each individual pixel in the middle row of pixels in the video
      int sliceDestination = i - slice_mask; //Pixels  will copied to the top row of the canvas
      int sliceSource = i; //Pixels will be copied from the center row of the video
      pixels[sliceDestination] = video.pixels[sliceSource]; //Copy the center row of the video to the top of the canvas
    }
    arrayCopy(pixels, 0, pixels, width, (height - 1) * width); //Move everything down one row to make room for new frames of video
    updatePixels();
  }
}
