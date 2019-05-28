float tx = 10;
float ty = 20;
float tr = 30;
float tcolor = 40;
float timer = 0;
int i = 0;
String textos[] = {
  "\\  una  /\nmosca",
  "_  una  _\nmosca"
};

//void settings()
//{
//  fullScreen();
//}


void setup()
{
  size(600, 600);
  // orientation(PORTRAIT);
  background(255);
  noStroke();
  // colorMode(HSB);
}

void draw()
{
  timer += 15;
  if (timer > 60)
  {
    timer = 0;
    i = 1 - i;
  }
  
  tx += 0.012;
  ty += 0.012;
  tr += 0.05;
  tcolor += 0.02;
  
  fill(255, 255);
  rect(0, 0, width, height);
  textAlign(CENTER);
  
  float angle = atan2(noise(tx) * width - width / 2, height - noise(ty) * height);
  
  pushMatrix();
  translate(width * noise(tx), (height - 80) * noise(ty));
  rotate(angle);
  fill(0);
  textSize(30);
  textLeading(25);
  text(textos[i], 0, 0);
  popMatrix();
  
  fill(160, 90, 0);
  textSize(75);
  textLeading(70);
  text("una\nmierda", width / 2, height - 85);
}
