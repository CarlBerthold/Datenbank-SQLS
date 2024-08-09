package IG_04_Vererbung_03_ToString;

public class Program
{

	public static void main(String[] args)
	{	
		Person person = new Person();
		
		person.setName("Hannelore");
		person.setAlter(33);
		
//		System.out.println(person.getName());
//		System.out.println(person.getAlter());
		
//		System.out.println(person.toString());
		System.out.println(person);	
	}
}
