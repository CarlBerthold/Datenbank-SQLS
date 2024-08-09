package IG_02_Array_01_Basic;

public class Program
{
	public static void main(String[] args)
	{
		// Deklarieren			--> Datentyp[] + Name
		int[] myArray;
		
		// Init.				--> Speicher + Elemente Standardwerte
		myArray = new int[3];
		
		// init
//		myArray[0] = 23;
//		myArray[1] = 70;
//		myArray[2] = 89;
		
		System.out.println("Element 1: " + myArray[0]);
		System.out.println("Element 2: " + myArray[1]);
		System.out.println("Element 3: " + myArray[2]);
		
		
		// Fehler weil dieses Element nicht vorhanden ist. 
		// ArrayIndexOutOfBoundsException
		// myArray[3] = 98;
		
	}
}