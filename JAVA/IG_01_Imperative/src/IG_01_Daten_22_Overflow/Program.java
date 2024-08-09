package IG_01_Daten_22_Overflow;

public class Program
{
	public static void main(String[] args)
	{	
		// 	Wenn die Grenze des Datentypes erreicht wird, dann kippt der Datenwert.
		// 	--> Vom Höchstmöglichen zum niedrigsten Wert.
		
		int wert = Integer.MAX_VALUE;
		
		System.out.println(wert);
		
		wert = wert + 1;
		
		System.out.println(wert);	
	}
}