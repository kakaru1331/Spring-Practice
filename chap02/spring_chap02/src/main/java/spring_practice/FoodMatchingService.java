package spring_practice;

public class FoodMatchingService {
	
	private FoodContainer foodContainer;
	private FoodMismatchLogger foodMismatchLogger;	
	
	public MatchingInfo foodMatch(String name, String color) {
		Food food = foodContainer.findFoodByName(name);
		
		if (food == null)
			throw new FoodNotFoundException();
		
		
		// dummy
		return new MatchingInfo("hi");
	}
}
