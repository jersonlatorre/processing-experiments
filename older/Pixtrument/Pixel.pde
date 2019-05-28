class Pixel
{
	float x;
	float y;
	float size;
	float dsizeUp;
	float dsizeDown;
	int h;
	int s;
	int b;
	int alpha;
	int state;

	//PGraphics pg;
	
	final int STATE_UNTOUCHED = 0;
	final int STATE_TOUCHED = 1;

	Pixel(float x, float y)
	{
		this.x = x;
		this.y = y;
		size = 0.0;
		dsizeUp = 3;
		dsizeDown = 0.2;
		
		h = (int)random(100);

		state = STATE_UNTOUCHED;
	}

	void onTouch()
	{
		state = STATE_TOUCHED;
	}

	void onUntouch()
	{
		state = STATE_UNTOUCHED;
	}

	void draw()
	{
		switch (state)
		{
			case STATE_TOUCHED:
			{
				size += dsizeUp * frameRate / 30;

				if (size >= Global.pixelSize)
				{
					size = Global.pixelSize;
				}

				break;
			}

			case STATE_UNTOUCHED:
			{
				size -= dsizeDown * frameRate / 30;

				if (size <= 0)
				{
					size = 0;
				}

				break;
			}
		}

		fill(h, s, b, 255 * size / Global.pixelSize);
		//rect(x - (size / 2) + 1, y - (size / 2) + 1, size - 2, size - 2);
		pushMatrix();
		translate(x, y, 50);
		colorMode(HSB, 100);
		fill(20, 100, 100, 0);
		stroke(100);
		strokeWeight(2);
		// noStroke();
		box(size);
		popMatrix();

		// stroke(0);
		// strokeWeight(3);
		// fill(r, g, b, 255 * size / Global.pixelSize);
		// rect(x - (size / 2), y - (size / 2), size, size);

		// noStroke();
		// fill(0, 255 * size / Global.pixelSize);
		// rect(x - (size / 4), y - (size / 4), size / 2, size / 2);
	}
}
