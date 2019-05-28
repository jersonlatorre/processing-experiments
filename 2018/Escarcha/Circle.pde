class Circle
{
	PVector position;
	PVector velocity;
	PVector center;
	float speed;

	public Circle(float x, float y)
	{
		position = new PVector();
		velocity = new PVector(0, 0);
		position.x = x;
		position.y = y;
		center = new PVector(width / 2, height / 2);
		speed = 40 + random(5.0);
	}

	void draw()
	{
		center = new PVector(mouseX, mouseY);
    
		if (dist(position.x, position.y, center.x, center.y) < 30 && isMousePressed)
		{
			velocity = PVector.mult(PVector.sub(position, center).normalize(), speed);
			position = PVector.add(position, velocity);
		}

		float r = random(3);
    colorMode(HSB);
		fill(random(255), 255, 255);
		ellipse(position.x, position.y, r, r);
	}
}
