package reply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	//세영
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
	//세영
	@RequestMapping("/board/replyReply.do")
	public String replyReply( Model model, ReplyVO rVO) {
		rService.replyReplyInsert(rVO);
		return "spot/include/return";
	}
	//세영
	@RequestMapping("/board/replyDelete.do")
	public String replyDelete(ReplyVO rVO, @RequestParam("reply_num")int reply_num) {
		rService.replyDelete(reply_num);
		return "spot/include/return";
	}
	
	//슬기
	@RequestMapping("/board/reDelete.do")
	public String reDelete(ReplyVO rVO, @RequestParam("reply_num")int reply_num) {
		rService.replyDelete(reply_num);
		return "include/return";
	}
	
	//슬기
	@RequestMapping("/board/reReply.do")
	public String reReply( Model model, ReplyVO rVO) {
		rService.replyReplyInsert(rVO);
		return "board/gallery/replyAjax";
	}
	//슬기
	@RequestMapping("/board/galleryReply.do")
	public String replyInsert1( Model model, ReplyVO rVO) {
		rService.replyInsert(rVO);
		return "include/return";
	}
	//슬기
	@RequestMapping("/board/replyList.do") 
	public String replyList(Model model, HttpServletRequest req, ReplyVO vo) {
		List<ReplyVO> list = rDao.replyList(vo);
		model.addAttribute("list", list); 
		return "board/gallery/replyAjax";
	}
}
