package IG_03_Observer_01_Basic;

public class Sensor
{
	private int neueTemperatur;
	
	private Display display;
	private Heizung heizung;
	private Klima klima;
	
	public Sensor(Display display,Heizung heizung, Klima klima )
	{
		this.display = display;
		this.heizung = heizung;
		this.klima = klima;
	}
	
	public void setTemp (int neueTemperatur)
	{
		this.neueTemperatur = neueTemperatur;
		display.geanderteTemperatur(neueTemperatur);
		heizung.geanderteTemperatur(neueTemperatur);
		klima.geanderteTemperatur(neueTemperatur);	
	}
}
