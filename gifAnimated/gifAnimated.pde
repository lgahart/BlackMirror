int numFrames = 3;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(640, 480);
  frameRate(10);
  images[0]  = loadImage("party.png");
  images[1]  = loadImage("error.png"); 
  images[2]  = loadImage("neon.png"); 
} 
 
void draw() 
{ 
  background(255,125,0);
  frame = frame + 1;
  if (frame>=numFrames){
   frame=0; 
  }
 // frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 50, 50);
}
