package IG_05_Poly_01_Basic;

public class Person extends Lebewesen
{	
	private String lieblingsFarbe;	
	public String getLieblingsFarbe()
	{
		return lieblingsFarbe;
	}
	public void setLieblingsFarbe(String lieblingsFarbe)
	{
		this.lieblingsFarbe = lieblingsFarbe;
	}

	public String toString()
	{
		return super.toString() + "\nLieblingsfarbe: " + getLieblingsFarbe();
	}
}