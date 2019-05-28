static class Global
{
	// COLORS
	static int COLOR_FLOOR_NORMAL = 255;
	static int COLOR_BOGO = 0;
	static int COLOR_BACKGROUND = 127;

	// WORLD
	static int UNIT = 40;
	static float GRAVITY = 0.0025;

	// BOGO
	static float BOGO_MAX_SPEED = 0.5;
	static float BOGO_MIN_SPEED = 0.5;
	static float BOGO_WIDTH = 1;
	static float BOGO_HEIGHT = 1;
	static float BOGO_INITIAL_POSITION_X = 4;
	static float BOGO_INITIAL_POSITION_Y = 0;

	static float BOGO_JUMP_1_IMPULSE = 0.7;
	static float BOGO_JUMP_2_IMPULSE = 0.7;
	static int BOGO_FRAMES_FOR_JUMP_2 = 8;

	// VARS
	static int dt;
	static float globalOffset;
	static float screenOffset;
	static int tilesOffset;
	static Bogo bogo;
	static BogoPrototype prototype;
	static int frameRate = 60;
}
