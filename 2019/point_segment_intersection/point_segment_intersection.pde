PVector p1 = new PVector(200, 250);
PVector p2 = new PVector(400, 350);

void setup()
{
	size(600, 600);
}

void draw()
{
	background(255);
	PVector M = new PVector(mouseX, mouseY);
	PVector u = PVector.sub(p2, p1).normalize();

	// p1 + proj
	// p1 + |M - p1| * cos(a) * u
	// p1 + |M - p1| * [(p2 - p1) . (M - p1) / |M - p1| * |p2 - p1|] * u
	// p1 + u * (M - p1) . (p2 - p1) / |p2 - p1|
	// p1 + u * (M - p1) . u

	PVector p = PVector.add(p1, PVector.mult(u, PVector.dot(PVector.sub(M, p1), u)));


	strokeWeight(2);
	line(p1.x, p1.y, p2.x, p2.y);
	fill(255);
	circle(mouseX, mouseY, 10);
	fill(0, 0, 255);

	// if (PVector.cross(PVector.sub(M, p), PVector.sub(p, p1)) < 0)
	// {
	// 	fill(255, 0, 0);
	// }
	
	circle(p.x, p.y, 10);
}
