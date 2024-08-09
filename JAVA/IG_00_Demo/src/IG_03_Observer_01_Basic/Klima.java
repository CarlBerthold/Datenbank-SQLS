package IG_03_Observer_01_Basic;

public class Klima
{
	private int checkTemp = 27;
	private boolean isAn;
	
	public void geanderteTemperatur(int neueTemperatur)
	{
		if(neueTemperatur > checkTemp && !isAn) 
		{
			isAn = true;
			
			System.out.println("Klima wird eingeschaltet.");
		}
		
		if(neueTemperatur <= checkTemp && isAn) 
		{
			isAn = false;
			
			System.out.println("Klima wird ausgeschaltet.");
		}
	}
}
