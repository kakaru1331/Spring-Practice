package a.b.c.upload;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	@RequestMapping("/upload")
	public String uploadMain() {
		return "upload/upload-main";
	}
	
	@RequestMapping("/upload/form")
	public String uploadForm() {
		return "upload/upload-form";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(
			@RequestParam("title") String title,
			@RequestParam("file") MultipartFile multipartFile,
			Model model) throws IOException {
		
		if (!multipartFile.isEmpty()) {
			File file = new File("C:\\upload", multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			
			model.addAttribute("title", title);
			model.addAttribute("fileName", multipartFile.getOriginalFilename());
			
			return "upload/success";
		}
		
		return "upload/fail";
	}
	
}
