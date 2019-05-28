PVector p1 = new PVector(300, 300);
PVector p2 = new PVector(220, 340);
PVector p3 = new PVector(300, 250);
PVector p4 = new PVector(380, 340);
PVector p5 = new PVector(300, 300);

float breath = 0;
float eyesHeight = 15;

void setup()
{
  size(600, 600);
  surface.setTitle("-- x --");
  strokeJoin(ROUND);
}

void draw()
{
  background(255);

  breath = 5 * sin(millis() / 900.0);
  
  p1.x = mouseX - 40;
  p5.x = mouseX + 40;
  p1.y = mouseY;
  p5.y = mouseY;
  p3.x = 300 + (mouseX - 300) / 15.0;
  p3.y = 300 + (mouseY - 300) / 20.0 - 40 + breath;

  if (frameCount % 150 < 10) eyesHeight = 0; else eyesHeight = 15;

  // brazos arriba
  scale(2);
  translate(-150, -130);
  noFill();
  stroke(0);
  strokeWeight(5);
  beginShape();
  curveVertex(p1.x, p1.y);
  curveVertex(p2.x, p2.y);
  curveVertex(p3.x, p3.y);
  curveVertex(p4.x, p4.y);
  curveVertex(p5.x, p5.y);
  endShape();

  // cuerpo
  fill(255);
  beginShape();
  // vertex(p3.x - 20, 360);
  // vertex(p3.x - 20, 250);
  // vertex(p3.x + 20, 250);
  // vertex(p3.x + 20, 360);
  endShape();

  // cabeza
  stroke(0);
  strokeWeight(5);
  fill(colors[2]);
  circle(p3.x, p3.y - 20, 65);

  // ojos
  stroke(0);
  fill(255);
  strokeWeight(3);
  ellipse(p3.x - 15, p3.y - 18, 16, eyesHeight);
  ellipse(p3.x + 15, p3.y - 18, 16, eyesHeight);
  fill(0);

  float angle = atan2(mouseY - 300, mouseX- 300);
  float r = map(dist(mouseX, mouseY, 300, 300), 0, 300, 0, 4);
  float dx = r * cos(angle);
  float dy = r * sin(angle);

  if (eyesHeight != 0)
  {
    circle(p3.x - 15 + dx, p3.y - 18 + dy, 3);
    circle(p3.x + 15 + dx, p3.y - 18 + dy, 3);
  }

  // brazos abajo
  noFill();
  stroke(0);
  strokeWeight(5);

  beginShape();
  curveVertex(p1.x, p1.y);
  curveVertex(p1.x, p1.y);
  curveVertex(p2.x, p2.y);
  curveVertex(p3.x, p3.y);
  endShape();

  beginShape();
  curveVertex(p5.x, p5.y);
  curveVertex(p5.x, p5.y);
  curveVertex(p4.x, p4.y);
  curveVertex(p3.x, p3.y);
  endShape();

  // manos 
  stroke(0);
  fill(255);
  circle(p1.x, p1.y, 18);
  circle(p5.x, p5.y, 18);
}
