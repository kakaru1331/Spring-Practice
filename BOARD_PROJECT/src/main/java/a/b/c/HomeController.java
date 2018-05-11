package a.b.c;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {		
		
		return "main";
	}
	
	@RequestMapping(value = "/joinP", method = RequestMethod.GET)
	public String joinP() {		
		
		return "joinP";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@RequestParam Map map) {		
		String id = (String) map.get("id");
		String password = (String) map.get("password");
		
		if ("".equals(id) || "".equals(password))
			return "joinP";
				
		return "loginP";
	}
	
	@RequestMapping(value = "/loginP", method = RequestMethod.GET)
	public String loginP() {		
		
		return "loginP";
	}
}
