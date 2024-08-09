package IG_02_Array_02_Schleifen;

public class Program
{
	public static void main(String[] args)
	{	
		int anzahl = 5;
		
		String[] namen;
		
		namen = new String[anzahl];
		
		for (int index = 0; index < anzahl ; index++)
		{
			namen[index] = "Name";
		}
		
		for (int index = 0; index < anzahl ; index++)
		{
			System.out.println(index + ".Element: " + namen[index]);
		}
	}
}