var video;

// Step 5. Read from the camera when a new image is available!
function setup() {  
  createCanvas(1024,600 );
  tint(255, 30);
 
  // Step 3. Initialize Capture object.
  video = createCapture(VIDEO);
	video.size(1024,600)
  
  // Step 4. Start the capturing process.
}

 Step 6. Display the image.
function draw() {  
image(video, 0, 0);
}