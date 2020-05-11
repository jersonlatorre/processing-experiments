ArrayList <Line> lines;
Line line;

void setup()
{
	size(800, 800, P3D);
	noiseDetail(2);

	lines = new ArrayList<Line>();
}

void draw()
{
	background(0);
	strokeWeight(1);
	stroke(255);
	noFill();

	for (int i = 0; i < lines.size(); ++i)
	{
		lines.get(i).draw();
	}

	if (line != null)
	{
		line.draw();
	}
}

void mouseDragged()
{
	line.addPoint(mouseX, mouseY);
}

void mousePressed()
{
	line = new Line();
	line.addPoint(mouseX, mouseY);
}

void mouseReleased()
{
	line.addPoint(mouseX, mouseY);
	lines.add(line);
	line = null;
}
