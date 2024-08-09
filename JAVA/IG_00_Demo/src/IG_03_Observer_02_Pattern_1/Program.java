package IG_03_Observer_02_Pattern_1;

public class Program 
{
	public static void main(String[] args) 
	{
		Heizung heizung = new Heizung();
		Klima klima = new Klima();
		Display display = new Display();
		
		Sensor sensor = new Sensor();
		sensor.anmelden(display);
		sensor.anmelden(heizung);
		sensor.anmelden(klima);
		
		sensor.setTemp(-6);			
		sensor.setTemp(28);	
		sensor.setTemp(-10);
	}
}