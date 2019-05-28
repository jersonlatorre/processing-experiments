class Floor
{
	float x;
	float y;
	float w;
	float h;

	Floor(float _x, float _y, int _w, int _h)
	{
		x = _x * Global.UNIT;
		y = _y * Global.UNIT;
		w = _w * Global.UNIT;
		h = _h * Global.UNIT;
	}

	void update()
	{
		x -= Global.bogo.speedX * Global.dt;
	}

	void draw()
	{
		noStroke();
		fill(255);
		rect(x, y, w, h);
	}
}