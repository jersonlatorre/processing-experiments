import ddf.minim.*;
import ddf.minim.analysis.FFT;

Minim minim;
AudioPlayer sound;
// AudioInput sound;

FFT fft;

void setup()
{
    size(500, 500);
    frameRate(10);
    rectMode(CENTER);
    minim = new Minim(this);
    // sound = minim.loadFile("cariñito.mp3");
    sound = minim.loadFile("nullsleep.mp3");
    // sound = minim.getLineIn();
    fft = new FFT(sound.bufferSize(), sound.sampleRate());
    fft.linAverages(10);
    fft.window(FFT.GAUSS);
    sound.play();

    noStroke();
}

void draw()
{
    background(255);

    fft.forward(sound.mix);

    float size = fft.specSize();
    float w = width / size;

    for (int i = 0; i < size - 1; i += 5)
    {
        // fill(255, 0, 0);
        // rect(i * w, height / 2, 1 * w, fft.getBand(i) * 20);
        stroke(1);
        line(i * w, fft.getBand(i) * 20, (i + 1) * w, fft.getBand(i + 1));
    }

    float max = 0;

    for(int i = 0; i < sound.bufferSize() - 1; i++)
    {
        if (sound.left.get(i) > max) max = sound.left.get(i);
        // max += song.left.get(i);
    }

    float r = 100 * sound.left.get(100);
    r = 150 * max;
    fill(0);
    noStroke();
    ellipse(width / 2 + 120, height / 2, r, r);
}