package IG_04_Kontrolle_02_Switch;

public class Program
{
	public static void main(String[] args)
	{
		int wert = 2;
		
		switch (wert)
		{
			case 1:
				System.out.println("1");
			break;
			
			case 2:
				System.out.println("2");
			break;
			
			case 3:
				System.out.println("3");
			break;

			default:
				System.out.println("ANDERS");
			break;
		}
	}
}