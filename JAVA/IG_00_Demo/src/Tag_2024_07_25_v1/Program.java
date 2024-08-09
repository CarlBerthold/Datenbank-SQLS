package Tag_2024_07_25_v1;

import java.util.Scanner;

public class Program
{

	public static void main(String[] args)
	{
		double x = 0;
		double y = 0;
		
		x = liesZahlEin();
		y = liesZahlEin();
	}
	
	public static double liesZahlEin()
	{
		double wert = 0;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Bitte geben Sie eine Zahl ein: ");
		wert = sc.nextDouble();
		
		return wert;
	}
}
