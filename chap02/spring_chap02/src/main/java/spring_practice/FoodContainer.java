package spring_practice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FoodContainer {
	
	private Map<String, Food> foodMap = new HashMap();
	
	public Food findFoodByName(String name) {
		return foodMap.get(name);
	}
	
	public void setFoods(List<Food> foods) {
		for (Food food : foods)
			foodMap.put(food.getName(), food);
	}
	
}
