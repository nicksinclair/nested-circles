/*
Project 0: Nested Circles

Nicholas Sinclair
GTID: 903112656
Date: 01/13/2019
CS 3451
Turk
*/

// Angle
float theta;

// Radii
float r1; // bigger radius
float r2; // smaller radius

// Trig Calculations
float trigC;
float trigS;

void setup() { 
  theta = 0;
  
  r1 = 400.0;
  
  size(800, 800);
}

void draw() {
  // Yellow Background
  background(255, 255, 0);
  
  // Moves the origin from top-left corner to middle
  translate(width / 2, height / 2);
  
  // Changes the radii of the smaller circles based on mouse y-position
  r2 = 0.7 * (height - mouseY - 1);
  
  // Fill Color, red with 25% opacity
  fill(255, 0, 0, 63);
  //noStroke();
  
  // Big Circle
  ellipse(0, 0, r1 * 2.0, r1 * 2.0);
  
  // Smaller Circles
  for (int i = 0; i < 3; i++) {
    // Precompute sines and cosines
    trigC = cos(theta - (3 * (1 + i) + i) * (PI / 6));
    trigS = sin(theta - (3 * (1 + i) + i) * (PI / 6));
    
    // Draw circles - recursive call
    drawEllipse(trigC * (r1 - (r2 / 2.0)), trigS * (r1 - (r2 / 2.0)), r2, 6);
  }
  
  // Rotate the circles clockwise one revolution
  theta = (PI * mouseX) / r1;
}

// Recursive function for drawing circles within each other
void drawEllipse(float x, float y, float r, int depth) {
  // Draw a new circle or radius r at x and y
  ellipse(x, y, r, r);
  
  // Updated radius
  float newR = 0.7 * (r) * (height - mouseY) / height;
  
  if(depth > 1) {
    // Decrease the depth
    depth--;
    
    for (int i =0; i < 3; i++) {
      // Precompute sines and cosines
      trigC = cos(theta - (3 * (1 + i) + i) * (PI / 6));
      trigS = sin(theta - (3 * (1 + i) + i) * (PI / 6));
      
      // Draw circles - recursive call
      drawEllipse(x + trigC * ((r / 2.0) - (newR / 2.0)), y + trigS * ((r / 2.0) - (newR / 2.0)), newR, depth);
    }
  }
}
