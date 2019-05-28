float depth = 1000;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  
  background(0);
  camera(800 * cos(frameCount / 100.0), 800 * sin(frameCount / 100.0), 500, width/2, height/2, 50, 0, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  strokeWeight(4);
  noFill();
  box(200);
  box(100);
  line(100,100,100,50,50,50);
  line(-100,-100,-100,-50,-50,-50);
  line(-100,-100,100,-50,-50,50);
  line(-100,100,100,-50,50,50);
  line(100,-100,100,50,-50,50);
  line(100,100,-100,50,50,-50);
  line(-100,100,-100,-50,50,-50);
  line(100,-100,-100,50,-50,-50);
  }
