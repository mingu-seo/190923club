package category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService cService;
	
	@RequestMapping("/board/categoryInsert.do")
	public String categoryInsert(CategoryVO vo, @RequestParam("spot_num")String spot_num, HttpServletRequest request) {
		cService.categoryInsert(vo, request);
		return "redirect:/board/submain/admincategory.do?spot_num="+spot_num;
	}
	
}
