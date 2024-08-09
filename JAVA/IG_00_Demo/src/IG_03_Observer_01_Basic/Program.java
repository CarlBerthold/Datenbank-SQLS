package IG_03_Observer_01_Basic;

public class Program 
{
	public static void main(String[] args) 
	{
		Heizung heizung = new Heizung();
		Klima klima = new Klima();
		Display display = new Display();
		
		Sensor sensor = new Sensor(display,heizung,klima);
		
		sensor.setTemp(-6);	
		
		sensor.setTemp(10);	
		
		sensor.setTemp(28);	
		
		sensor.setTemp(-10);
	}
}