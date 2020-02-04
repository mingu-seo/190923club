package like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LikeController {

	@Autowired
	LikeService lService;
	
	@RequestMapping("/board/likeInsert.do")
	public String likeInsert(LikeVO vo, Model model) {
		
		lService.likeInsert(vo);
		int value = 0;
		// 있어서 삭제, 카운트-1
		value = 1;
		// 없어서 등록, 카운트+1
		value = 0;
		model.addAttribute("value", value);
		return "spot/include/return";
	}
}
