void slitScan() {
  loadPixels(); 
   
   video.loadPixels();
   //img.loadPixels();
   
   int w = video.width;
   int h = video.height;

   copy(video, 0, h/2, w, 2, 0, y, w, 2);
   copy(video, w/2, 0, 2, h, x, 0, 2, h);

   y = y + 2;
   x = x + 2;
  
    if (y > height) {
    y = 0;
    }
    
    if (x > width) {
    x = 0;
    }
}
