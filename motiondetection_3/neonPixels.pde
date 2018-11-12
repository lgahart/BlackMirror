void neonPixels() {
  background(255, 255, 255);
  video.loadPixels();
  
  for (int i = 0; i < cols; i++) {    
  // Begin loop for rows    
    for (int j = 0; j < rows; j++) {      
    // Where are you, pixel-wise?      
    int x = i*videoScale;      
    int y = j*videoScale;    
        
     // Reverse the column to mirro the image.
    int loc = (video.width - i - 1) + j * video.width;       
    color c = video.pixels[loc];
    float sz = (brightness(c)/255) * videoScale;       
    rectMode(CENTER);       
    rect(x + videoScale/2, y + videoScale/2, sz, sz);
    count = count + 1;
    
    // fill the columns with color array
    fill(randomColor[picker]);
    noStroke();
    if (count > 100){
      picker = round(random (0,4));
      count = round(random (0,10)*3);
      }
    }
  }
}
