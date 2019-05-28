class Bogo
{
	final int STATE_ON_FLOOR = 0;
	final int STATE_JUMPING_UP_1 = 1;
	final int STATE_JUMPING_UP_2 = 2;
	final int STATE_JUMPING_DOWN = 3;
	final int STATE_DEAD = 4;

	float x;
	float y;
	float w;
	float h;
	float speedX;
	float speedY;
	int state;
	int framesAfterJump;

	Bogo()
	{
		Global.bogo = this;
		x = Global.BOGO_INITIAL_POSITION_X * Global.UNIT;
		y = Global.BOGO_INITIAL_POSITION_Y * Global.UNIT;


		w = Global.BOGO_WIDTH * Global.UNIT;
		h = Global.BOGO_HEIGHT * Global.UNIT;
		
		speedX = Global.BOGO_MIN_SPEED;
		speedY = 0;

		setState(STATE_JUMPING_DOWN);
	}

	void update()
	{
		speedY += Global.GRAVITY * Global.dt;
		y += speedY * Global.dt;

		if (speedY > 0)
		{
			setState(STATE_JUMPING_DOWN);
		}

		if (state == STATE_JUMPING_UP_1)
		{
			framesAfterJump++;
			// println("frames: " + framesAfterJump);

			if (framesAfterJump >= Global.BOGO_FRAMES_FOR_JUMP_2 && mousePressed)
			{
				jump_2();
			}
		}
	}

	void draw()
	{
		fill(Global.COLOR_BOGO);
		rect(x, y, w, h);
	}

	void jump_1()
	{
		if (state == STATE_ON_FLOOR)
		{
			// println("jump_1");
			setState(STATE_JUMPING_UP_1);
			speedY = -Global.BOGO_JUMP_1_IMPULSE;

			framesAfterJump = 0;
		}
	}

	void jump_2()
	{
		// println("jump_2");
		setState(STATE_JUMPING_UP_2);
		speedY = -Global.BOGO_JUMP_2_IMPULSE;
	}

	void setState(int _state)
	{
		if (state == _state) return;

		state = _state;
		
		switch (_state)
		{
			case STATE_ON_FLOOR:
			{
				speedY = 0;
			}
		}
	}
}