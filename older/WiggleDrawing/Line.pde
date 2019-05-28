class Line
{
	ArrayList <PVector> points;
	ArrayList <PVector> movedPoints;
	float tx;
	float ty;

	Line()
	{
		points = new ArrayList <PVector>();
		movedPoints = new ArrayList <PVector>();
		tx = 0;
		ty = 0;
	}

	void addPoint(float x, float y)
	{
		points.add(new PVector(x, y));
	}

	void draw()
	{
		movedPoints = new ArrayList <PVector>();
		
		tx += 0.05;
		ty = 0;

		for (int i = 0; i < points.size(); ++i)
		{
			ty += 0.02;
			movedPoints.add(new PVector(points.get(i).x + 18 * noise(tx, ty) - 4, points.get(i).y + 18 * noise(tx + 500, ty) - 4));
		}

		for (int i = 0; i < movedPoints.size() - 1; ++i)
		{
			line(movedPoints.get(i).x, movedPoints.get(i).y, movedPoints.get(i + 1).x, movedPoints.get(i + 1).y);
		}

		// beginShape(POLYGON);

		// for (int i = 0; i < movedPoints.size(); ++i)
		// {
		// 	curveVertex(movedPoints.get(i).x, movedPoints.get(i).y);
		// }

		// endShape();
	}
}