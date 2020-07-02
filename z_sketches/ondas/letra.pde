class Letra
{
	char c;
	float x;
	float y;
	float angle;
	float delta;
	float r;
	float noiseSeed;
	float offset;

	Letra(char c, float x, float y)
	{
		// this.x = 10 * int(random(width) / 10);
		// this.y = random(height);
		this.x = x;
		this.y = y;
		this.c = c;
		this.r = 15;
		noiseSeed = random(0, 100);
		angle = random(2 * PI);
		delta = random(0.01, 0.05);
		offset = random(0, 1);
	}

	void draw()
	{
		float a = 5 + 35 * noise(noiseSeed, offset);
		offset += 0.05;
		fill(255, map(a, 5, 35, 0, 120));
		textSize(a);
		pushMatrix();
		translate(x, y);
		float xx = r * cos(angle);
		float yy = r * sin(angle);
		angle += delta;
		text(c, xx, yy);
		popMatrix();
	}
}