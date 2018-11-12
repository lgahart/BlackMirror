var video;
var y = 0; //start from the top
var x = 0; //start from the left

function setup() {
    createCanvas(windowWidth, windowHeight);
    pixelDensity(1);
    video = createCapture(VIDEO);
    video.size(windowWidth, windowHeight);
    video.hide();
}

function draw() {
    video.loadPixels();
    var w = video.width;
    var h = video.height;

    copy(video, 0, h/2, w, 20, 0, y, w, 20);//load y pixels
    copy(video, w/2, 0, 2, h, x, 0, 2, h );//load x pixels

    y = y + 1;
    x = x + 1;

    if (y > height, x > width) {
        y = 0; //start from the top
        x = 0; //start from the left
    }
}