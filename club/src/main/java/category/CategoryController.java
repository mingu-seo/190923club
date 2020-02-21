package category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService cService;
	
	@Autowired
	private board.BoardService bService;
	
	
	@RequestMapping("/board/categoryInsert.do")
	public String categoryInsert(Model model, CategoryVO vo, @RequestParam("spot_num")String spot_num, HttpServletRequest request) {
		int r = cService.categoryInsert(vo, request);
		
		String msg = "";
		String url = "";
		
		if(r>0) {
			msg = "카테고리가 추가되었습니다.";
			url = "/board/submain/admincategory.do?spot_num="+spot_num;
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		return "include/alert";
	}
	
	@RequestMapping("/board/categoryDelete.do")
	public String categoryDelete(CategoryVO vo) {
		bService.allBoard_delete(vo.getCategory_id());
		cService.categoryDelete(vo);
		return "/include/return";
	}
}
