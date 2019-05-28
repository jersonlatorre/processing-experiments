class UnknownPleasures extends Visual
{
	PlayerCar player;
	float nx = 0;
	float ny = 0;
	float nz = 0;

	int NUM_LINES = 60;
	int RESOLUTION = 200;

	UnknownPleasures()
	{
		noiseDetail(3);

		vWidth = 300;
		vHeight = 800;
		vLeftBound = width / 2 - vWidth / 2;
		vTopBound = height / 2 - vHeight / 2;

		player = new PlayerCar(vWidth, vHeight, vLeftBound, vTopBound, vWidth / 2, 450);
	}

	void draw()
	{
		background(0);

		update();
		drawFinal();
	}

	void update()
	{
		player.update();
	}

	void drawFinal()
	{
		// drawDebug();
		rotateX(.75);
		translate(0, -140, -120);
		float tempZ;

		noFill();
		stroke(255);
		strokeWeight(1);

		for (int i = 0; i < NUM_LINES; ++i)
		{
			beginShape();

			for (int j = 0; j < RESOLUTION; ++j)
			{
				float dx = (player.x - (j * vWidth / RESOLUTION));
				float dy = (player.y - (i * vHeight / NUM_LINES));
				float rx = (player.W / 2);
				float ry = (player.H / 2);
				float dr = sqrt(dx * dx + dy * dy);

				float h = (dx * dx) / (rx * rx);
				float k = (dy * dy) / (ry * ry);

				if (h + k <= 1)
				{
					nx = (float)i / 8.0 - nz * 2;
					ny = (float)j / 8.0;
					tempZ = 60 * noise(nx, ny, nz) * (1 - h - k);
				}
				else
				{
					tempZ = 0;// i * vHeight / NUM_LINES;
				}

				vertex(vLeftBound + j * vWidth / RESOLUTION, vTopBound + i * vHeight / NUM_LINES, tempZ);
			}

			endShape();
		}

		nz += 0.02;
	}

	void drawDebug()
	{
		fill(255, 255, 0, 40);
		noStroke();
		rect(vLeftBound, vTopBound, vWidth, vHeight);

		player.drawDebug();
	}
}

class PlayerCar
{
	float W = 120;
	float H = 120;
	float MAX_SPEED_X = 0.3;
	float MAX_SPEED_Y = 0.3;
	float FRICTION = 0.9;
	float ACCELERATION = 0.02;

	float x;
	float y;
	float offsetX;
	float offsetY;
	int vWidth;
	int vHeight;

	float f = 0.0;
	float speedX;
	float speedY;

	PlayerCar(int _vWidth, int _vHeight, float _offsetX, float _offsetY, float _x, float _y)
	{
		vWidth = _vWidth;
		vHeight = _vHeight;
		offsetX = _offsetX;
		offsetY = _offsetY;
		
		x = _x;
		y = _y;
	}

	void drawDebug()
	{
		update();

		fill(255, 0, 0, 40);
		noStroke();
		rect(x + offsetX - W / 2, y + offsetY - H / 2, W, H);
	}

	void update()
	{
		if (Keyboard.isLeft)
		{
			speedX -= ACCELERATION;

			if (speedX < -MAX_SPEED_X)
			{
				speedX = -MAX_SPEED_X;
			}
		}

		if (Keyboard.isRight)
		{
			speedX += ACCELERATION;
			
			if (speedX > MAX_SPEED_X)
			{
				speedX = MAX_SPEED_X;
			}
		}

		if (Keyboard.isDown)
		{
			speedY += ACCELERATION;

			if (speedY > MAX_SPEED_Y)
			{
				speedY = MAX_SPEED_Y;
			}
		}

		if (Keyboard.isUp)
		{
			speedY -= ACCELERATION;
			
			if (speedY > MAX_SPEED_Y)
			{
				speedY = MAX_SPEED_Y;
			}
		}

		if (!Keyboard.isLeft && !Keyboard.isRight)
		{
			speedX *= FRICTION;

			if (abs(speedX) <= 0.001)
			{
				speedX = 0;
			}
		}

		if (!Keyboard.isUp && !Keyboard.isDown)
		{
			speedY *= FRICTION;

			if (abs(speedY) <= 0.001)
			{
				speedY = 0;
			}
		}

		x += speedX * Global.dt;
		y += speedY * Global.dt;

		if (x - W / 2 < 20)
		{
			x = W / 2 + 20;
			speedX = 0;
		}

		if (x + W / 2 > vWidth - 20)
		{
			x = vWidth - W / 2 - 20;
			speedX = 0;
		}

		if (y - H / 2 < 20)
		{
			y = H / 2 + 20;
			speedY = 0;
		}

		if (y + H / 2 > vHeight - 20)
		{
			y = vHeight - H / 2 - 20;
			speedY = 0;

		}
	}
}