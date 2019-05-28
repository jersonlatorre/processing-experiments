import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

float range;
float size;
float minAngle = 1;
float maxAngle = 90;
int iterations = 7;
int index = 0;
String words[] = {
	"GROW",
	"FREE"
};

float angle;
float h;

void setup()
{
	size(800, 800, P3D);
	textFont(createFont("gidole.regular.ttf", 10));
	size = height / 4.4;
	smooth(2);
	frameRate(24);
	colorMode(HSB);

  fx = new PostFX(this);
}

void draw()
{
	background(255);
	drawBackground();
	stroke(0);
	textAlign(CENTER);

	angle += PI / 80;

	if (angle < 2 * PI || angle > 4 * PI) index = 0;
	else index = 1;

	if (angle > 4 * PI)
	{
		angle = 0;
		// noLoop();
	}

	range = minAngle + (maxAngle - minAngle) * 0.5 * (cos(angle - 135) + 1);
	strokeWeight(iterations * abs(sin(angle / 2)) * height / 500);
	h = height / 16 + height / 4 * cos(angle - 135);
	stroke(20);
	line(width / 2.0, height - h, width / 2.0, height);
	drawBranch(width / 2, height - h, new PVector(0, -1), size, iterations);

	fill(20);
	rect(0, height - height / 10, width, height / 10);

	// saveFrame("frames/frame-####.png");
	 fx.render()
    // .noise(.2, .1)
    // .pixelate(200)
    // .sobel()
    // .toon()
    // .chromaticAberration()
    .rgbSplit(20)
    // .bloom(0.9, 10, 10)
    // .vignette(.5, .2)
    .compose();
}

void drawBackground()
{
	// for (int i = 0; i < height; i++)
	// {
	// 	float c = map(i, 0, height, 50, 220);
	// 	strokeWeight(1);
	// 	stroke(56 + 200 * cos(angle / 2 - 30), 50, c);
	// 	line(0, i, width, i);
	// }
}

void drawBranch(float x, float y, PVector d, float length, int n)
{
	stroke(20);
	strokeWeight(n * abs(sin(angle / 2)) * height / 500);
	float f = .7 * abs(sin(angle / 2));
	line(x, y, x + length * d.normalize().x, y + length * d.normalize().y);

	if (n != 1)
	{
		PVector v1 = rotateVector(d, range);
		drawBranch(x + length * d.normalize().x, y + length * d.normalize().y, v1, length * f, n - 1);

		PVector v2 = rotateVector(d, -range);
		drawBranch(x + length * d.normalize().x, y + length * d.normalize().y, v2, length * f, n - 1);
	}
	else
	{
		fill(255);
		noStroke();
		int r = 1;
		textSize(height / 45 * f + height / 80);
		pushMatrix();
		translate(x + length * d.normalize().x, y + length * d.normalize().y);
		fill(255, 255, 255);
		// text(words[index], 0, 0);
		ellipse(0, 0, 30 * f, 30 * f);
		popMatrix();
	}
}

PVector rotateVector(PVector vector, float angle)
{
	angle = angle * PI / 180.0;
	PVector p = new PVector();
	p.x = vector.x * cos(angle) - vector.y * sin(angle);
	p.y = vector.x * sin(angle) + vector.y * cos(angle);

	return p;
}
