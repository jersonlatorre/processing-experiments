ArrayList<PVector> points;

void setup()
{
    size(800, 800, P3D);
    colorMode(HSB);

    

    drawVoronoi();
}

void draw()
{
    // if (points != null)
    // {
    //     points.get(0).x = mouseX;
    //     points.get(0).y = mouseY;
    // }

    // drawVoronoi();
}

void drawVoronoi()
{
    background(0);

    points = new ArrayList<PVector>();

    for (int i = 0; i < 300; i++)
    {
        float x = 150 + random(width - 300);
        float y = 150 + random(height - 300);
        points.add(new PVector(x, y));
    }

    for (float j = 0; j < 2 * PI; j += PI / 100.0)
    {
        float x = width / 2 + 200 * cos(j);
        float y = height / 2 + 200 * sin(j);
        // points.add(new PVector(x, y));
        println(j);
    }

    loadPixels();
  
    PVector paux;
  
    for (int i = 0; i < width * height; i++)
    {
        float y = i / width;
        float x = i % width;
    
        int minIndex = 0;
        float min = 9999999;
        for (int n = 0; n < points.size(); n++)
        {
            paux = points.get(n);
            // if (paux.x - x > 200 || paux.y - y > 200) continue;
            float d = distsq(x, y, paux.x, paux.y);
            if (d < min)
            {
                min = d;
                minIndex = n;
            }
        }
    
        float c = map(minIndex, 0, points.size() - 1, 120, 200);
    
        pixels[i] = color(c, 200, 255);
    }
  
    updatePixels();
  
  
    for(PVector p : points)
    {
        noStroke();
        fill(255);
        ellipse(p.x, p.y, 6, 6);
    }

    int i1 = int(random(points.size()));
    PVector p1 = points.get(i1);

    for (int j = 0; j < 30; j++)
    {
        int i2 = int(random(points.size()));   
        PVector p2 = points.get(i2);
        strokeWeight(1);
        stroke(255);
        //line(p1.x, p1.y, p2.x, p2.y);

        p1 = p2;
    }

    noFill();
    stroke(255);
    strokeWeight(1);
    //rect(50, 50, width - 100, height - 100);
    // rect(55, 55, width - 110, height - 110);
    // ellipse(width / 2, height / 2, 400, 400);
    translate(width / 2, height / 2);
    // box(300);
}

void mousePressed()
{
    drawVoronoi();
    save("images/hola" + random(1000) + ".png"); 
}

void keyPressed()
{
    save("hola-" + frameCount + ".png");
}

float distsq(float x1, float y1, float x2, float y2)
{
    return sq(x1 - x2) + sq(y1 - y2);
}
