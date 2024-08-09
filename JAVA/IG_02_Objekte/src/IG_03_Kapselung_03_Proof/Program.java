package IG_03_Kapselung_03_Proof;

public class Program
{
	public static void main(String[] args)
	{	
		int eingabePin = 53;
		
		Person person = new Person();
		
		person.setName("Hannelore",eingabePin);
		System.out.println(person.getName());
	}
}
