import procontroll.*;
import java.io.*;

ControllIO controlIO;
ControllDevice controlJuego;
ControllSlider sliderX;
ControllSlider sliderY;

void setup()
{
	size(400, 400);
	controlIO = ControllIO.getInstance(this);
	controlJuego = controlIO.getDevice(2);
	controlJuego.printSliders();

	controlJuego.plug(this, "onButton_1", ControllIO.ON_PRESS, 0);
	controlJuego.plug(this, "onButton_2", ControllIO.ON_PRESS, 1);
	//controlJuego.plug(this, "onSlider_1", ControllIO.WHILE_PRESS, 0);

	controlJuego.printSliders();
	sliderX = controlJuego.getSlider(1);
	sliderY = controlJuego.getSlider(0);
	sliderX.setTolerance(0.01);
	sliderY.setTolerance(0.01);
  	//sliderX.setMultiplier(0.05f);
}

void onButton_1()
{
	fill(255, 0, 0);
}

void onButton_2()
{
	fill(0, 255, 0);
}

void onSlider_1()
{
	// println();
}

void draw()
{
	//background(0);
	println(sliderX.getValue());
	ellipse(200 + 100 * sliderX.getValue(), 200 + 100 * sliderY.getValue(), 20, 20);
}