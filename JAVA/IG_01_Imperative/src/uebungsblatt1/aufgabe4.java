package uebungsblatt1;

import java.util.Scanner;

public class aufgabe4
{

	public static void main(String[] args)
	{
		// Create a Scanner object to read input from the console
        Scanner scanner = new Scanner(System.in);

        // Eingaben
        System.out.print("Vorname: ");
        String firstName = scanner.nextLine();
        System.out.print("Nachname: ");
        String lastName = scanner.nextLine();
        System.out.print("Straße: ");
        String street = scanner.nextLine();
        System.out.print("Hausnummer: ");
        String houseNumber = scanner.nextLine();
        System.out.print("PLZ: ");
        String postalCode = scanner.nextLine();
        System.out.print("Ort: ");
        String city = scanner.nextLine();

        // Ausgaben
        System.out.println("\nVorname: " + firstName);
        System.out.println("Nachname: " + lastName);
        System.out.println("Adresse:");
        System.out.println(street + " " + houseNumber);
        System.out.println(postalCode + " " + city);

	}

}
