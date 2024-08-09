package IG_03_Kapselung_01_Basic;

public class Program
{
	public static void main(String[] args)
	{	
		Person person = new Person();
//		person.name = "a";
		
		person.setName("Hannelore");
		
		System.out.println(person.getName());
	}
}
