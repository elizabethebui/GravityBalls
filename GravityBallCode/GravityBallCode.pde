//declare variables
int count = 30;
float [] x = new float[count];
float [] y = new float[count];
float []velX = new float[count];
float []velY = new float[count];
float []diam = new float[count];
float g;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for(int i = 0; i <count; i++){
  x[i] = width/2;
  y[i] = height/2;
  diam[i] = 80;
  velX[i] = random(-5,5);
  velY[i] = random(-5,5);
  g = 2;
}
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for(int i = 0; i<count; i++){
    if(dist(x[i], y[i], mouseX, mouseY) < diam[i]/2){
      ellipse(x[i], y[i], 200, 200);
      fill(random(255));
  }
  //draw ball
  ellipse(x[i], y[i], diam[i], diam[i]);
  stroke(255,0,255);
  fill(255,0,255,50);

  //add velocity to position
  velY[i] += g;
  velY[i] *= 0.99;
  x[i] += velX[i];
  y[i] += velY[i];


 
  //bounce ball if it hits walls
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
    y[i] = height - diam[i]/2;
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
}
}