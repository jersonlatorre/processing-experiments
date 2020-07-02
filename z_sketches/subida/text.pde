class Text
{
	float offset;

	Text()
	{

	}

	void draw()
	{
		for (int i = 0; i < 6; i++)
		{
			offset = random(-8, 8);
			if (i == 0)
			{
				fill(255);
			}
			else
			{
				fill(255, 20 - i * 20 / 6.0);
			}

  		text("PLUG", width / 2 + random(-3, 3), height * .5 + offset + i * height / 40);
		}
	}
}