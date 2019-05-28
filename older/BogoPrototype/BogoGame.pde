
class BogoGame
{
	int lastTime = 0;
	int currentTime = 15;
	float offset;
	ArrayList<Floor> floors;
	Grid grid;
	Bogo bogo;

	JSONObject data;

	BogoGame()
	{
		bogo = new Bogo();
		floors = new ArrayList<Floor>();
		floors.add(new Floor(0, 5, 20, 4));
		floors.add(new Floor(24, 2, 20, 4));
		floors.add(new Floor(48, 5, 200, 4));

		grid = new Grid();

		/*data = loadJSONObject("data/patterns.json");
		JSONArray patterns = data.getJSONArray("patterns");

		for (int i = 0; i < patterns.size(); ++i)
		{
			JSONObject object = patterns.getJSONObject(i);
			int id = object.getInt("id");
			JSONArray sequence = object.getJSONArray("sequence");
			
			for (int j = 0; j < sequence.size(); ++j)
			{
				JSONObject piece = sequence.getJSONObject(j);
				//println("type: " + piece.getString("type") + ", value: " + piece.getInt("size"));
			}
		}*/
	}

	void update()
	{
		if (bogo.state == bogo.STATE_DEAD) return;

		for (int i = 0; i < floors.size(); ++i)
		{
			floors.get(i).update();
		}

		bogo.update();
		collideBogo();
	}

	void draw()
	{
		if (bogo.state == bogo.STATE_DEAD) return;

		for (int i = 0; i < floors.size(); ++i)
		{
			floors.get(i).draw();
		}

		bogo.draw();
	}

	void screenTouched()
	{
		bogo.jump_1();
	}

	void screenUntouched()
	{
		if (bogo.state == bogo.STATE_JUMPING_UP_1)
		{
			bogo.setState(bogo.STATE_JUMPING_UP_2);
		}
	}

	void createRandomFloor()
	{
		floors.add(new Floor((int)(Global.globalOffset + width) / Global.UNIT - (float)Global.globalOffset / (float)Global.UNIT, 5, 4, 4));
	}

	void collideBogo()
	{
		for (int i = 0; i < floors.size(); ++i)
		{
			Floor floor = floors.get(i);
			
			// si hay colisión
			if (!(bogo.x + bogo.w < floor.x || floor.x + floor.w < bogo.x || bogo.y + bogo.h < floor.y || floor.y + floor.h < bogo.y))
			{
				// colisión con bordes laterales
				if (bogo.y + bogo.h - 2 * bogo.speedY * Global.dt > floor.y)
				{
					bogo.speedX *= -1;

					// colisión izquierda
					if (bogo.x + bogo.w / 2 < floor.x)
					{
						bogo.x = floor.x - bogo.w;
					}

					// colisión derecha
					if (bogo.x + bogo.w / 2 > floor.x + floor.w)
					{
						bogo.x = floor.x + floor.w;
					}
				}
				else
				{
					bogo.y = floor.y - bogo.h;
					bogo.setState(bogo.STATE_ON_FLOOR);	
				}

				return;
			}
			else
			{
				if (bogo.y > height)
				{
					bogo.setState(bogo.STATE_DEAD);
					Global.prototype.resetGame();
				}
			}
		}
	}
}