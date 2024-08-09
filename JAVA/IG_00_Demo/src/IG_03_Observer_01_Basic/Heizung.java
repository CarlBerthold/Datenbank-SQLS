package IG_03_Observer_01_Basic;

public class Heizung
{
	private int checkTemp = -1;
	private boolean isAn;
	
	public void geanderteTemperatur(int neueTemperatur)
	{
		if(neueTemperatur < checkTemp && !isAn) 
		{
			isAn = true;
			
			System.out.println("Heizung wird eingeschaltet.");
		}
		
		if(neueTemperatur >= checkTemp && isAn) 
		{
			isAn = false;
			
			System.out.println("Heizung wird ausgeschaltet.");
		}
	}
}
