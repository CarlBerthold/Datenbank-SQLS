package IG_03_Oper_01_Arith;

public class Program
{
	public static void main(String[] args)
	{
		// int numberOne,numberTwo,result;
		int numberOne = 10;
		int numberTwo = 7;
		int result = 0;
		
		// Addition
		result = numberOne + numberTwo;
		System.out.println("Addition Ergebnis: " + result);
		
		// Subtraktion
		result = numberOne - numberTwo;
		System.out.println("Subtraktion Ergebnis: " + result);
		
		// Multiplikation
		result = numberOne * numberTwo;
		System.out.println("Multiplikation Ergebnis: " + result);
		
		// Division
		result = numberOne / numberTwo;
		System.out.println("Division Ergebnis: " + result);
		
		// Modulo
		result = numberOne % numberTwo;
		System.out.println("Modulo Ergebnis: " + result);
		
		// Inkrement - Praefix - 1.erhöhen 2.zuweisen
		result = ++numberOne;
		System.out.println("Praefix numberOne  " + numberOne);
		System.out.println("Praefix Ergebnis: " + result);
		
		// Inkrement - Postfix - 1.zuweisen 2.erhöhen
		result = numberTwo++;
		System.out.println("Postfix numberTwo: " + numberTwo);
		System.out.println("Postfix Ergebnis: " + result);
		
		// Deinkrement - Praefix
		result = --numberOne;
		System.out.println("Praefix numberOne  " + numberOne);
		System.out.println("Praefix Ergebnis: " + result);
		
		// Deinkrement - Postfix
		result = numberTwo--;
		System.out.println("Postfix numberTwo: " + numberTwo);
		System.out.println("Postfix Ergebnis: " + result);
	}
}