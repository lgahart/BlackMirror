var randomColor = [color('#4deeea'), color('#74ee15'), color('#ffe700'), color('#f000ff'), color('#001eff')];
var picker = 0;
var vScale = 10;
var cols, rows;
var video;
											 

function setup() { 
  createCanvas(800,600);
	pixelDensity(2);
	video = createCapture;
	video.size = (width/vScale, height/vScale);

}

function draw() { 
	video.loadPixels();
    loadPixels();
	for (var y = 0; y < video.height; y++){
		for (var x = 0; x < video.width; x++){
			var index = (video.width - x + 1 + (y * video.height) )*4;
			var r = video.pixels[index + 0];
			var g = video.pixels[index + 1];
			var b = video.pixels[index + 2];
			var bright = (r+g+b/3);
			
			var w = map(bright, 0, 255, vScale);
			rectMode(CENTER);
			rect(x*vScake, y*VSsale, w, w);
		}
		
	}
    // fill the columns with color array
    fill(randomColor[picker]);
    noStroke();
//    
//    if (mousePressed){
//      picker = round(random (0,4));
//    }
}