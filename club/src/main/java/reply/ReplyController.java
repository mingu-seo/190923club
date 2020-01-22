package reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {

	@Autowired
	ReplyDAO rDao;
	
	@Autowired
	ReplyService rService;
	
	@RequestMapping("/board/reply.do")
	public String replyInsert(@RequestParam("post_id")int post_id, Model model, ReplyVO vo) {
		rService.replyInsert(vo);
		model.addAttribute("vo",vo);
		return "redirect:/board/notice/noticeWriteView.do?post_id="+post_id;
	}
	
}
