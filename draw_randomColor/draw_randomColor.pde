color[] randomColor = {#45B7B8, #706381, #2C3848, #F7DE1C, #FEFED5};
int picker = 0;
int bubbleSize = 200;

void setup(){
  size(800,600);// create canvas
  smooth();
  noStroke();
}

void draw(){
  fill(randomColor[picker]);
  ellipse(mouseX, mouseY, bubbleSize, bubbleSize);
  if (mousePressed){
    picker = round(random (0,4));
  print(mouseX, mouseY);
  }
}
