package uebungsblatt1;

import java.util.Scanner;

public class aufgabe3
{

	public static void main(String[] args)
	{
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter the first number: ");
        int number1 = scanner.nextInt();
        
        System.out.print("Enter the second number: ");
        int number2 = scanner.nextInt();
        
        boolean result = isGreater(number1, number2);
        
        
        if (result) {
            System.out.println("The first number is greater than the second number.");
        } else {
            System.out.println("The first number is not greater than the second number.");
        }
	}
	
	
	public static boolean isGreater(int number1, int number2)
	{
		return number1 > number2;
	}

}
