package a.b.c;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import a.b.c.board.Board;
import a.b.c.board.BoardDAO;
import a.b.c.user.User;
import a.b.c.user.UserDAO;

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
	
	@RequestMapping(value = "/loginP")
	public String loginP(Model model) {		
		return "loginP";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @RequestParam String id, @RequestParam String password,
			HttpSession session) {		
		UserDAO userDAO = new UserDAO();
		int ret = userDAO.login(id, password);
		
		if (ret == 1) {
			session.setAttribute("id", id);
			
			return "redirect: /main";
		}
		
		model.addAttribute("ret", ret);
		
		return "redirect: /loginP";
	}
	
	@RequestMapping(value = "/joinP")
	public String joinP(Model model) {
		return "joinP";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, @RequestParam Map<String, String> map) {		
		User user = new User();
		
		user.setId(map.get("id"));	
		user.setPassword(map.get("password"));
		user.setName(map.get("name"));
		user.setGender(map.get("gender"));
		
		UserDAO userDAO = new UserDAO();		
		int ret = userDAO.join(user);		
		model.addAttribute("ret", ret);
		
		return "join";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		
		return "main";
	}
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		
		return "main";
	}
	
	@RequestMapping(value = "/board")
	public String board(Model model, @RequestParam Map map) {
		BoardDAO boardDAO = new BoardDAO();
		String pageNumber = (String) map.get("pageNumber");
		int page = 1;
		
		if (pageNumber != null) {
			page = Integer.parseInt(pageNumber);
		}
		
		List<Board> postList = boardDAO.getPostList(page);		
		model.addAttribute("postList", postList);
		model.addAttribute("page", page);
		
		Map<String, Integer> paging = boardDAO.page(page);
		int beginPage = paging.get("beginPage");
		int endPage = paging.get("endPage");
		int totalPages = paging.get("totalPages");		
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPages", totalPages);
		
		return "board";
	}
	
	@RequestMapping(value = "/writeP")
	public String writeP(Model model, HttpSession session) {
		if (session.getAttribute("id") == null) 
			return "loginP";
		
		return "writeP";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, HttpSession session,
			@RequestParam String title,
			@RequestParam String contents) {	
		BoardDAO boardDAO = new BoardDAO();
		String id = (String) session.getAttribute("id");
		
		if ("".equals(title))
			return "writeP";
		
		boardDAO.write(title, contents, id);		
		
		return "redirect:" + "main";
	}
	
	@RequestMapping(value = "/board/post")
	public String post(Model model, @RequestParam int postNumber) {	
		Board board = new Board();
		BoardDAO boardDAO = new BoardDAO();		
		board = boardDAO.getPost(postNumber);
		
		String title = board.getTitle();
		String id = board.getId();
		String date = board.getReg_date();
		String contents = board.getCotents();
		
		model.addAttribute("title", title);
		model.addAttribute("id", id);
		model.addAttribute("date", date);
		model.addAttribute("contents", contents);
		
		return "post";
	}
	
	@RequestMapping(value = "/board/editP")
	public String editP(Model model, @RequestParam int postNumber, HttpSession session) {
				
		Board board = new Board();
		BoardDAO boardDAO = new BoardDAO();
		board = boardDAO.getPost(postNumber);
		
		String title = board.getTitle();
		String id = board.getId();
		String date = board.getReg_date();
		String contents = board.getCotents();
		
		String sessionId = (String) session.getAttribute("id");
		
		if (id.equals(sessionId) == false)
			return "redirect: /board";
		
		model.addAttribute("title", title);
		model.addAttribute("contents", contents);
		
		return "editP";
	}
	
	@RequestMapping(value = "/board/edit", method = RequestMethod.POST)
	public String edit(Model model, @RequestParam int postNumber, @RequestParam Map map) {
		String title = (String) map.get("title");
		String contents = (String) map.get("contents");		
		
		Board board = new Board();
		BoardDAO boardDAO = new BoardDAO();
		int ret = boardDAO.edit(title, contents, postNumber);
		
		return "redirect: /board";
	}
	
	@RequestMapping(value = "/board/delete")
	public String delete(Model model, @RequestParam int postNumber) {		
		
		Board board = new Board();
		BoardDAO boardDAO = new BoardDAO();
		int ret = boardDAO.delete(postNumber);
		
		return "redirect: /board";
	}
	
	
}
