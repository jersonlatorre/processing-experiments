// Pixtrument
/*import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;/*

/* PostFX fx;*/

Pixel[][] pixels;
PGraphics pgPixels;
int o;
int _o;
int bias;
int columns;
int rows;
float pixelSize;

void setup()
{
  //orientation(LANDSCAPE);
  noStroke();
  fill(204);
  
  //fx = new PostFX(this);

  size(800, 800, P3D);
  smooth(8);
  
  camera(width/2.0, height/2.0, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  o = Global.orientation;
  _o = 1 - Global.orientation;
  bias = Global.bias;
  columns = Global.columns;
  rows = Global.rows;
  pixelSize = Global.pixelSize;

  pixels = new Pixel[Global.columns][Global.rows];

  for (int i = 0; i < Global.columns; i++)
  {
     for (int j = 0; j < Global.rows; j++)
  	{
	  	pixels[i][j] = new Pixel(i * pixelSize, j * pixelSize);
	 	}
  }
}

void draw()
{
  background(255);

	for (int i = 0; i < Global.columns; i++)
  {
    for (int j = 0; j < Global.rows; j++)
    {
	 	 pixels[i][j].draw();
    }
  }
  
  /*fx.render()
    .noise(.2, .1)
    //.vignette(.5, .2)
    //.pixelate(400)
    //.sobel()
    //.chromaticAberration()
    .rgbSplit(20)
    .bloom(0.5, 50, 30)
    .compose();*/
}


void mouseDragged()
{
  processTouch();
}

void mousePressed()
{
  processTouch();
}

void keyPressed()
{
  save("pics/capture-" + random(1000) + ".png");
}

void processTouch()
{
  float distance_1;
  float distance_2;

  for (int i = 0; i < Global.columns; i++)
  {
    for (int j = 0; j < Global.rows; j++)
    {
      if (mouseX < pixels[i][j].x + bias &&
          mouseX > pixels[i][j].x - bias && 
          mouseY < pixels[i][j].y + bias && 
          mouseY > pixels[i][j].y - bias ||
          mouseX < pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].x + bias &&
          mouseX > pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].x - bias && 
          mouseY < pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].y + bias && 
          mouseY > pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].y - bias)
      {
        distance_1 = dist(mouseX, mouseY, pixels[i][j].x,  pixels[i][j].y);
        distance_2 = dist(mouseX, mouseY, pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].x,  pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].y);

        if (distance_1 < bias || distance_2 < bias)
        {
          pixels[i][j].onTouch();
          pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].onTouch();
        }
        else
        {
          pixels[i][j].onUntouch();
          pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].onUntouch();
        }
      }
      else
      {
        pixels[i][j].onUntouch();
        pixels[i * _o + (columns - i - 1) * o][j * o + (rows - j - 1) * _o].onUntouch();
      }
    }
  }
}

void mouseReleased()
{
  for (int i = 0; i < columns; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      pixels[i][j].onUntouch();
    }
  }
}

void clear()
{
	fill(0);
	rect(0, 0, width, height);
}
