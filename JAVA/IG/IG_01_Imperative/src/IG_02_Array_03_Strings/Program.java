package IG_02_Array_03_Strings;

public class Program
{
	public static void main(String[] args)
	{	
		String name;
		name = "Jenny";
		
		for (int i = 0; i < name.length() ; i++)
		{
			System.out.println("Buchstabe: " + name.charAt(i));
		}		
	}
}