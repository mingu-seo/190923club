package reply;

import java.util.List;

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
	public String replyInsert( Model model, ReplyVO rVO) {
		rService.replyInsert(rVO);
		return "spot/include/return";
	}
	
	//댓글 ajax
	@RequestMapping("/board/replyListAjax.do")
	public String replyListAjax(Model model, ReplyVO vo, @RequestParam("post_id")int post_id, @RequestParam("board_id") int board_id)   {
		List<ReplyVO> list = rDao.replyList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "board/notice/noticeReplyAjax";
	}
	
	@RequestMapping("/board/replyReply.do")
	public String replyReply( Model model, ReplyVO rVO) {
		rService.replyReplyInsert(rVO);
		return "spot/include/return";
	}
	
	@RequestMapping("/board/replyDelete.do")
	public String replyDelete(ReplyVO rVO, @RequestParam("reply_num")int reply_num) {
		rService.replyDelete(reply_num);
		return "spot/include/return";
	}
	
}
