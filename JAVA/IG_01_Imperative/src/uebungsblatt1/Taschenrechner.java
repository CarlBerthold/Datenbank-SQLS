package uebungsblatt1;

import java.util.Scanner;

public class Taschenrechner
{
    public static void main(String[] args)
    {
        // Create a Scanner object to read input from the console
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the first number
        System.out.print("Bitte geben Sie die erste Zahl ein: ");
        double zahl1 = scanner.nextDouble();

        // Prompt the user to enter the second number
        System.out.print("Bitte geben Sie die zweite Zahl ein: ");
        double zahl2 = scanner.nextDouble();

        // Prompt the user to enter the operation
        System.out.print("Bitte geben Sie die Rechenoperation ein (+, -, *, /): ");
        char operation = scanner.next().charAt(0);

        double ergebnis = 0;
        boolean gueltigeOperation = true;

        // Perform the operation based on user input
        switch (operation)
        {
            case '+':
                ergebnis = zahl1 + zahl2;
                break;
            case '-':
                ergebnis = zahl1 - zahl2;
                break;
            case '*':
                ergebnis = zahl1 * zahl2;
                break;
            case '/':
                if (zahl2 != 0) {
                    ergebnis = zahl1 / zahl2;
                } else {
                    System.out.println("Fehler: Division durch Null ist nicht erlaubt.");
                    gueltigeOperation = false;
                }
                break;
            default:
                System.out.println("Ungültige Operation.");
                gueltigeOperation = false;
        }

        // Print the result if the operation was valid
        if (gueltigeOperation) {
            System.out.println(zahl1 + " " + operation + " " + zahl2 + " = " + ergebnis);
        }

    }
}
