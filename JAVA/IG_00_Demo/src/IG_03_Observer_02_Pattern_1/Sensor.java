package IG_03_Observer_02_Pattern_1;

import java.util.ArrayList;

public class Sensor 
{
	private int geanderteTemperatur;
	
	private ArrayList<ITempBeobachter> listeBeobachter = new ArrayList<ITempBeobachter>();
	
	public void anmelden(ITempBeobachter beobachter)
	{
		listeBeobachter.add(beobachter);
	}
	
	public void abmelden(ITempBeobachter beobachter)
	{
		listeBeobachter.remove(beobachter);
	}
	
	private void informiereBeobachter()
	{
		for (ITempBeobachter beobachter : listeBeobachter)
		{
			beobachter.geanderteTemperatur(geanderteTemperatur);
		}
	}
	
	public void setTemp (int checkTemp)
	{
		this.geanderteTemperatur = checkTemp;
		informiereBeobachter();		
	}
}
