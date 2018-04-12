package a.b.c.food;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	
	@RequestMapping("/food/{foodName}")
	public String foodDetail(@PathVariable String foodName, Model model) {
		model.addAttribute("foodName", foodName);
		
		return "food/"+foodName;
	}
}
