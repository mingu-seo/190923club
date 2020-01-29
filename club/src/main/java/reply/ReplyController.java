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
	public String replyInsert( Model model, ReplyVO rVO) {
		rService.replyInsert(rVO);
		return "redirect:/board/notice/noticeWriteView.do?post_id="+rVO.getPost_id() +"&board_id="+rVO.getBoard_id();
	}
	
	@RequestMapping("/board/replyReply.do")
	public String replyReply( Model model, ReplyVO rVO) {
		rService.replyReplyInsert(rVO);
		return "redirect:/board/notice/noticeWriteView.do?post_id="+rVO.getPost_id() +"&board_id="+rVO.getBoard_id();
	}
	
	@RequestMapping("/board/replyDelete.do")
	public String replyDelete(ReplyVO rVO, @RequestParam("reply_num")int reply_num) {
		rService.replyDelete(reply_num);
		return "redirect:/board/notice/noticeWriteView.do?board_id=3&post_id="+rVO.getPost_id();
	}
	
}
