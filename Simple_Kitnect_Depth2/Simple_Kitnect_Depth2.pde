//import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;

void setup() {
  size(640, 480);
  //kinect2 = new Kinect2(this);
  //kinect2.initDepth();
  ////kinect2.enableColorDepth(false);
  
   kinect2 = new Kinect2(this);
  kinect2.initVideo();
  kinect2.initDepth();
  kinect2.initIR();
  kinect2.initRegistered();
  // Start all data
  kinect2.initDevice();
  
 
}

void draw() {
  background(0);
  
  PImage img = kinect2.getDepthImage();
  image (img, 0, 0);
  
  int skip = 20;
  for (int x = 0; x < img.width; x+=skip) {
    for (int y = 0; y < img.height; y+=skip) {
      int index = x + y * img.width;
      float b = brightness(img.pixels[index]);
      fill (b);
      rect(x, y, skip, skip);

    }  
  }
}
