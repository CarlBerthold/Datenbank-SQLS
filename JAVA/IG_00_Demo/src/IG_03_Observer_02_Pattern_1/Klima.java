package IG_03_Observer_02_Pattern_1;

public class Klima implements ITempBeobachter
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
