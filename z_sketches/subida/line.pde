class Line
{
	float x;
	float y;
	color c;
	float a;
	float w;
	float h;

	Line(float x, float y)
	{
		this.x = x;
		this.y = y;
		c = colors[int(random(5))];
		a = random(20, 120);
		w = random(width / 10000, width / 400);
		h = random(height / 40, height / 3);
	}

	public void draw()
	{
		y += height / 20;
		if (y > height) y -= height;
		noStroke();
		fill(c, a);
		rect(x, y, w, h);
	}
}