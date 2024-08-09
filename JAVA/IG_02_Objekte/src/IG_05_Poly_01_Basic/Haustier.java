package IG_05_Poly_01_Basic;

public class Haustier extends Lebewesen
{
	private boolean darfRaus;
	public boolean getDarfRaus()
	{
		return darfRaus;
	}
	public void setDarfRaus(boolean darfRaus)
	{
		this.darfRaus = darfRaus;
	}
	
	public String toString()
	{
		return super.toString() + "\nDarfRaus: " + getDarfRaus();
	}
}