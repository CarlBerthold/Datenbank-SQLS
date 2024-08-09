package uebungsblatt1;
import java.util.Scanner;

public class aufgabe2
{
    public static void main(String[] args)
    {
        // Create a Scanner object to read input from the console
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the first number: ");
        int number1 = scanner.nextInt();

        System.out.print("Enter the second number: ");
        int number2 = scanner.nextInt();

        // Call the sum method and store the result
        int result = sum(number1, number2);

        // Print the sum
        System.out.println("The sum is: " + result);
    }

    public static int sum(int num1, int num2)
    {
        return num1 + num2;
    }
}