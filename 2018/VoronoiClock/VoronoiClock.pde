// http://leebyron.com/mesh/mesh-0002.zip
// y copiar el contenido en la carpeta sketchbook

import megamu.mesh.*;

int N = 12;
float[][] points = new float[2 * N + 1][2];
float rotation = 0;

void setup()
{
    size(1000, 1000);
    colorMode(HSB);
    stroke(255);
    strokeWeight(2);

    for (int i = 0; i < N; i++)
    {
        float angle = i * 2 * PI / N;
        points[i][0] = width / 2 + 350 * cos(angle);
        points[i][1] = height / 2 + 350 * sin(angle);
    }

    for (int i = N; i < 2 * N; i++)
    {
        float angle = i * 2 * PI / N;
        points[i][0] = width / 2 + 250 * cos(angle);
        points[i][1] = height / 2 + 250 * sin(angle);
    }
}

void keyPressed()
{
  // save("images/hola" + random(1000) + ".png");
}

void draw()
{
    background(255);

    rotation += PI / 100;

    points[2 * N][0] = width / 2 + 200 * cos(rotation);
    points[2 * N][1] = height / 2 + 200 * sin(rotation);

    Voronoi voronoi = new Voronoi(points);

    // float[][] edges = voronoi.getEdges();
    MPolygon[] regions = voronoi.getRegions();

    for (int j = 0; j < 2 * N + 1; j++)
    {
        // fill(map(j, 0, regions.length - 1, 0, 255), 255, 255);
        float x = points[j][0] - width / 2;
        float y = points[j][1] - height / 2;
        float angle = -atan2(y, x);
        fill((map(angle, PI, -PI, 0, 255) + 195) % 255, 255, 255);
        if (j == 2 * N) fill(255);
        regions[j].draw(this);
        // line(edges[j][0], edges[j][1], edges[j][2], edges[j][3]);
    }

    for (int i = 0; i < 2 * N + 1; i++)
    {
        fill(255);
        if (i == 2 * N)
        {
            fill(0);
        }

        ellipse(points[i][0], points[i][1], 20, 20);
    }

    // if (rotation >= 2 * PI) noLoop();
    // saveFrame("frames/frame-###.png");
}

float frac(float n)
{
	return n - floor(n);
}

float rand(float n)
{
	return frac(sin(n) * 43758.5453);
}
