import processing.video.*;

int numPixels;
float []previousFrame;
Capture video;
float pixAverage;


void setup()
{
  size(800, 600);
  tint(255,30);
  video = new Capture(this, width, height);
  video.start(); 
  numPixels = video.width * video.height;
  previousFrame = new float[numPixels];
  loadPixels();
  //stroke(250, 45, 232);
  //strokeWeight(4);
  frameRate(10);
}
void draw()
{
  if (video.available())
  {
    video.read();
    video.loadPixels();
    int x = 0;
    int y = 0;
    int sum = 0;
    for (int i = 0; i < numPixels; i++)
    {
      float currColor = red(video.pixels[i]);
      float prevColor = previousFrame[i];
      float d = abs(prevColor-currColor);
      if (d>50)
      {
        int xt = i % video.width;
        int yt = i / video.width;
        x += xt;
        y += yt;
        sum ++;
        pixels[i] = color(currColor,0,0);
      }
      else
        pixels[i] = color(currColor);
      previousFrame[i] = currColor;
    }
    if (sum>1000)
    {
      updatePixels();
      x /= sum;
      y /= sum;    
      drawTarget(x,y);
    }
  }
}
void drawTarget(int x, int y)
{
  line(x,y-15 , x,y-4);
  line(x,y+15 , x,y+4);
  line(x-15,y , x-4,y);
  line(x+15,y , x+4,y);
}
