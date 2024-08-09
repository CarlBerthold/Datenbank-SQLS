package IG_03_Observer_02_Pattern_1;

public class Heizung implements ITempBeobachter
{
	private int checkTemp = -1;
	private boolean isAn = false;
	
	public void geanderteTemperatur(int neueTemperatur)
	{
		if(neueTemperatur < checkTemp && isAn == false) 
		{
			isAn = true;
			
			System.out.println("Heizung wird eingeschaltet.");
		}
		
		if(neueTemperatur >= checkTemp && isAn == true) 
		{
			isAn = false;
			
			System.out.println("Heizung wird ausgeschaltet.");
		}
	}
}
