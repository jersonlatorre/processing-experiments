/*import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;*/

Visual visual;
int lastTime = 0;
int currentTime = 15;
//PostFX fx;

void setup()
{
	size(800, 800, P3D);
	background(0);
	smooth(4);

	visual = new UnknownPleasures();
	//fx = new PostFX(this); 
}

void draw()
{
	background(0);

	updateTime();
	
	if (visual != null)
	{
		visual.draw();
	}

	/*fx
		.render()
    .bloom(0.5, 20, 40)
    .compose();*/
}

void keyPressed()
{
	switch (key)
	{
		case 'a':
		case 'A':
		{
			Keyboard.isLeft = true;
			break;
		}

		case 'd':
		case 'D':
		{
			Keyboard.isRight = true;
			break;
		}

		case 'w':
		case 'W':
		{
			Keyboard.isUp = true;
			break;
		}

		case 's':
		case 'S':
		{
			Keyboard.isDown = true;
			break;
		}
	}

	if (key == CODED)
	{
		switch (keyCode)
		{
			case LEFT:
			{
				Keyboard.isLeft = true;
				break;
			}
			case RIGHT:
			{
				Keyboard.isRight = true;
				break;
			}
			
			case UP:
			{
				Keyboard.isUp = true;
				break;
			}
			case DOWN:
			{
				Keyboard.isDown = true;
				break;
			}
		}
	}
}

void keyReleased()
{
	switch (key)
	{
		case 'a':
		case 'A':
		{
			Keyboard.isLeft = false;
			break;
		}

		case 'd':
		case 'D':
		{
			Keyboard.isRight = false;
			break;
		}

		case 'w':
		case 'W':
		{
			Keyboard.isUp = false;
			break;
		}

		case 's':
		case 'S':
		{
			Keyboard.isDown = false;
			break;
		}
	}

	if (key == CODED)
	{
		switch (keyCode)
		{
			case LEFT:
			{
				Keyboard.isLeft = false;
				break;
			}
			case RIGHT:
			{
				Keyboard.isRight = false;
				break;
			}
			case UP:
			{
				Keyboard.isUp = false;
				break;
			}
			case DOWN:
			{
				Keyboard.isDown = false;
				break;
			}
		}
	}
}

void updateTime()
{
	lastTime = currentTime;
	currentTime = millis();
	Global.dt = currentTime - lastTime;
}
