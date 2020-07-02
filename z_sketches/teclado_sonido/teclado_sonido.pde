import processing.sound.*;

boolean tocandoDO = false;
boolean tocandoRE = false;
boolean tocandoMI = false;
boolean tocandoFA= false;
boolean tocandoSOL = false;
boolean tocandoLA = false;
boolean tocandoSI = false;

float anchoNota = 600 / 7.0;

Pulse instrument;

void setup()
{
  size(600, 600);
  noStroke();
  colorMode(HSB);
  
  instrument = new Pulse(this);
}

void draw()
{
  fill(0, 30);
  rect(0, 0, width, height);
  
  if (tocandoDO)
  {
    fill(0, 255, 255);
    rect(0, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(261, 1);
  }
  
  if (tocandoRE)
  {
    fill(36, 255, 255);
    rect(anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(293, 1);
  }
  
  if (tocandoMI)
  {
    fill(72, 255, 255);
    rect(2 * anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(329, 1);
  }
  
  if (tocandoFA)
  {
    fill(109, 255, 255);
    rect(3 * anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(349, 1);
  }
  
  if (tocandoSOL)
  {
    fill(145, 255, 255);
    rect(4 * anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(392, 1);
  }
  
  if (tocandoLA)
  {
    fill(182, 255, 255);
    rect(5 * anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(440, 1);
  }
  
  if (tocandoSI)
  {
    fill(218, 255, 255);
    rect(6 * anchoNota, 0, anchoNota, 600);
    
    if (!instrument.isPlaying()) instrument.play(493, 1);
  }
}

void keyPressed()
{
  if (key == 'a') tocandoDO = true;
  if (key == 's') tocandoRE = true;
  if (key == 'd') tocandoMI = true;
  if (key == 'f') tocandoFA = true;
  if (key == 'g') tocandoSOL = true;
  if (key == 'h') tocandoLA = true;
  if (key == 'j') tocandoSI = true;
}

void keyReleased()
{
  instrument.stop();
  if (key == 'a') tocandoDO = false;
  if (key == 's') tocandoRE = false;
  if (key == 'd') tocandoMI = false;
  if (key == 'f') tocandoFA = false;
  if (key == 'g') tocandoSOL = false;
  if (key == 'h') tocandoLA = false;
  if (key == 'j') tocandoSI = false;
}
