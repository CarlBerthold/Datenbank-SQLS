package IG_01_Daten_23_Casten;

public class Program
{
	public static void main(String[] args)
	{
		byte byteWert = 127;								// 08 BIT
		int intWert = 128;									// 32 BIT
		
		System.out.println("byte zahl: " + byteWert);
		System.out.println("int zahl: " + intWert);
		
//		intWert = byteWert;									// Implizites 	--> KEIN WERT-VERLUST
//		System.out.println("--> zahl: " + intWert);
		
		byteWert = (byte)intWert;							// Explizites 	--> WERT-VERLUST
		System.out.println("--> Zahl: " + byteWert);
	}
}