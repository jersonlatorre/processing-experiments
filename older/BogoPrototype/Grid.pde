class Grid
{
	Grid()
	{
		
	}

	void update()
	{

	}

	void draw()
	{
		for (int i = 1; i <= width / Global.UNIT; ++i)
		{
			stroke(255, 255, 255, 30);
			line(i * Global.UNIT - Global.screenOffset, 0, i * Global.UNIT - Global.screenOffset, height);
		}

		for (int j = 1; j <= height / Global.UNIT; ++j)
		{
			stroke(255, 255, 255, 30);
			line(0, j * Global.UNIT, width, j * Global.UNIT);
		}
	}
}