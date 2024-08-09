package IG_03_Observer_02_Pattern_1;

public class Display implements ITempBeobachter
{
	public void geanderteTemperatur(int neueTemperatur)
	{	
		System.out.println("\n* * * * * * * * * * * * * *");
		System.out.println("\t  "+ neueTemperatur);
		System.out.println("* * * * * * * * * * * * * * \n");
	}

}
