package IG_04_Vererbung_02_Basic;

public class Program
{

	public static void main(String[] args)
	{	
		Lebewesen leb = new Lebewesen();
		leb.name = "Alf";
		leb.alter = 300;
		
		Person person = new Person();
		person.name = "Hannelore";
		person.alter = 33;
		person.lieblingFarbe = "Blau";
			
		Haustier haustier = new Haustier();
		haustier.name = "Lassie";
		haustier.alter = 10;
		haustier.darfRaus = true;
	}
}