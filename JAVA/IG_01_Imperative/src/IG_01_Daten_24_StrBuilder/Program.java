package IG_01_Daten_24_StrBuilder;

public class Program
{
	public static void main(String[] args)
	{	
		
//		// Version 1 -------------------------------------------------------------------
//		
//		String wert = "";
//		wert = wert + "0";
//		wert = wert + "1";
//		wert = wert + "2";
//		
//		System.out.println(wert);

//		// Version 2 -------------------------------------------------------------------
//		
//		String wert = "";
//		int anzahl = 1000000;
//		
//		for (int i = 0; i < anzahl; i++)
//		{
//			wert = wert + i;
//		}
//		
//		System.out.println(wert);
		
//		// Version 3 -------------------------------------------------------------------
		
		String wert = "";
		int anzahl = 1000000;
		
		StringBuilder sb = new StringBuilder();
		
		for (int i = 0; i < anzahl; i++)
		{
			sb.append(i);
		}
		
		System.out.println(sb);
	}
}