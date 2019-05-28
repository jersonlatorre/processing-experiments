ArrayList<Circle> circles = new ArrayList<Circle>();
boolean isMousePressed = false;

void setup()
{
	size(800, 800);
	noStroke();

	for (int i = 0; i < 20000; i++)
	{
		circles.add(new Circle(random(width), random(height)));
	}
}

void draw()
{
	background(0);

	for (Circle circle : circles)
	{
		circle.draw();
	}
}

void keyPressed()
{
	circles = new ArrayList<Circle>();

	for (int i = 0; i < 20000; i++)
	{
		circles.add(new Circle(random(width), random(height)));
	}
}

void mousePressed()
{
	isMousePressed = true;
}

void mouseReleased()
{
	isMousePressed = false;
}