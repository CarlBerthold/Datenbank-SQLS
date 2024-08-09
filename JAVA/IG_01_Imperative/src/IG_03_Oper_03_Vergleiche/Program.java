package IG_03_Oper_03_Vergleiche;

public class Program
{
	public static void main(String[] args)
	{
		// int numberOne,numberTwo,result;
		int numberOne = 10;
		int numberTwo = 9;
		
		boolean trueFalseResult;
			
		// Gleichheit
		trueFalseResult = (numberOne == numberTwo);
		System.out.println("Gleichheit Ergebnis: " + trueFalseResult);
		
		// Ungleich
		trueFalseResult = (numberOne != numberTwo);
		System.out.println("Ungleich Ergebnis: " + trueFalseResult);
		
		// kleiner
		trueFalseResult = (numberOne < numberTwo);
		System.out.println("kleiner Ergebnis: " + trueFalseResult);
		
		// kleiner-gleich
		trueFalseResult = (numberOne <= numberTwo);
		System.out.println("kleiner-gleich Ergebnis: " + trueFalseResult);
		
		// groesser
		trueFalseResult = (numberOne > numberTwo);
		System.out.println("groesser Ergebnis: " + trueFalseResult);
		
		// groesser-gleich
		trueFalseResult = (numberOne >= numberTwo);
		System.out.println("groesser-gleich Ergebnis: " + trueFalseResult);	
	}
}