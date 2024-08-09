package IG_02_Liste_20_Basic;

import java.util.ArrayList;

public class Program
{
	public static void main(String[] args)
	{
		// Deklarieren
		ArrayList<Integer> myList;
		
		// Init.				--> Speicher + Elemente Standardwerte
		myList = new ArrayList<Integer>();
		
		myList.add(23);
		myList.add(70);
		myList.add(89);
		
		System.out.println("Element 1: " + myList.get(0));
		System.out.println("Element 2: " + myList.get(1));
		System.out.println("Element 3: " + myList.get(2));
	}
}
