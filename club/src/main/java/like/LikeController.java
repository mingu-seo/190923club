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
		
		int value = 0;
		
		if (lService.like_select(vo) != null) {
			// 있어서 삭제, 카운트-1
			lService.likeDelete(vo);
			lService.like_up(false, vo.getTableName(), vo.getBoard_id(), vo.getPost_id(), vo.getMember_id());
			value = 1;
		} else {
			// 없어서 등록, 카운트+1
			lService.likeInsert(vo);
			lService.like_up(true, vo.getTableName(), vo.getBoard_id(), vo.getPost_id(), vo.getMember_id());
			value = 0;
		}
		
		model.addAttribute("value", value);
		return "spot/include/return";
	}
}
