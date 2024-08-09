package IG_02_Objekte_01_Konstruktor;

public class Program
{
	public static void main(String[] args)
	{
		Person personEins = new Person("Jenny",33);
		personEins.gibInfos();
		
		Person personZwei = new Person();
		personZwei.name = "Fred";
		personZwei.alter = 36;
		personZwei.gibInfos();
	}
}