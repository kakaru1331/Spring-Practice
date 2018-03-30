package spring_practice;

public class Food {
	
	private String name;
	private String color;
	
	
	public Food(String name, String color) {
		this.name = name;
		this.color = color;
	}	
	
	public String getName() {
		return name;
	}
	
	public boolean matchColor(String color) {
		return this.color.equals(color);
	}
	
	public void changeColor(String preColor, String newColor) {
		if (!matchColor(preColor))
			throw new IllegalArgumentException("illegal color");
		
		color = newColor;
	}
	
}
