package spring_practice;

public class FoodMismatchLogger {	
	
	private int limitCount;
	private int mismatchCount;
	
	public void mismatchFood(String name, String color) {
		System.out.printf(
				"Food not found. check name&color then retry plz.\n"
				+ "Name: %s, Color: %s", name, color);
		
		mismatchCount++;
		
		if (mismatchCount > limitCount) {
			System.out.println("Many failed...");
		}
	}
	
	public void setLimitCount(int limitCount) {
		this.limitCount = limitCount;
	}
	
}
