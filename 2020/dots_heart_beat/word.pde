class Word {
	public float y = -25;
	public float x;

	float t = 0;
	float timer = 0;
	final int STATE_START = 0;
	final int STATE_START_TO_MIDDLE = 1;
	final int STATE_MIDDLE = 2;
	final int STATE_MIDDLE_TO_END = 3;
	final int STATE_END = 4;
	final int STATE_END_TO_MIDDLE = 5;
	final int STATE_MIDDLE_2 = 6;
	final int STATE_MIDDLE_TO_START = 7;

	int state = STATE_START;
	
	Word() {
		x = width / 2;
	}

	void draw() {
		float s = SIZE / 800.0;

		switch (state) {
			case STATE_START:
				timer += 0.1;
				if (timer > 1) {
					timer = 0;
					state = STATE_START_TO_MIDDLE;
				}
				break;

			case STATE_START_TO_MIDDLE:
				y = lerp(y, height / (2 * s), t);
				t += 0.001;
				if (height / (2 * s) - y < 1) {
					state = STATE_MIDDLE;
					y = height / (2 * s);
					t = 0;
				}
				break;

			case STATE_MIDDLE:
				y = height / (2 * s);
				timer += 0.1;
				if (timer > 6) {
					timer = 0;
					state = STATE_MIDDLE_TO_END;
				}
				break;

			case STATE_MIDDLE_TO_END:
				y = lerp(y, height / s + 25, t);
				t += 0.003;
				if (height / s + 25 - y < 1) {
					state = STATE_END;
					y = height / s + 25;
					t = 0;
				}
				break;

			case STATE_END:
				y = -25;
				// timer += 0.1;
				// if (timer > 0) {
					// timer = 0;
					// y = -25;
					state = STATE_START;
				// }
		}

		//image(word, x, y);
	}
}
