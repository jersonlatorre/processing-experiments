
int lastTime = 0;
int currentTime = 15;
Grid grid;
BogoGame game;

void setup()
{
	size(800, 400);
	frameRate(Global.frameRate);
	orientation(LANDSCAPE);

	game = new BogoGame();
	grid = new Grid();

	Global.prototype = this;
}

void draw()
{
	background(Global.COLOR_BACKGROUND);
	updateTime();
	
	Global.globalOffset += Global.bogo.speedX * Global.dt;
	Global.screenOffset = Global.globalOffset - Global.UNIT * ((int)Global.globalOffset / Global.UNIT);


	if (game == null) return;

	game.update();
	grid.update();
	
	game.draw();
	grid.draw();

	text("" + frameRate, 20, 20);
}

void resetGame()
{
	game = new BogoGame();
}

// move to framework
void updateTime()
{
	lastTime = currentTime;
	currentTime = millis();
	Global.dt = currentTime - lastTime;

	if (Global.dt > 1500 / Global.frameRate)
	{
		Global.dt = 1000 / Global.frameRate;
	}
}

void mousePressed()
{
	game.screenTouched();
}

void mouseReleased()
{
	game.screenUntouched();
}
