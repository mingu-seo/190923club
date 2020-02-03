package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	public List<NoticeVO> noticeList(NoticeVO vo, int board_id) {
		List<NoticeVO> list = noticeDAO.noticeList(vo, board_id);
		return list;
	}
	
	//페이징처리
	public int[] noticeCount(NoticeVO vo) {
		int listcount = noticeDAO.count(vo); // 전체 갯수
		int totalpage = listcount / 10;		// 총페이지수
		if (listcount % 10 > 0) totalpage++;
		
		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;
		
		return pagecount;
	}
	
	public int noticeInsert(NoticeVO vo, int board_id) {
		return noticeDAO.noticeInsert(vo, board_id);
	}
	
	public NoticeVO noticeView(int post_id, int board_id) {
		noticeDAO.noticeViewUpdate(post_id);
		return noticeDAO.noticeView(post_id, board_id);
	}
	
	public int noticeDelete(int post_id) {
		return noticeDAO.noticeDelete(post_id);
	}
	
	public NoticeVO noticeUpdateForm(int post_id, int board_id) {
		return noticeDAO.noticeView(post_id, board_id);
	}
	
	public int noticeUpdate(NoticeVO vo, MultipartFile file, HttpServletRequest req) {
		return noticeDAO.noticeUpdate(vo);
	}
	
	public List<NoticeVO> mainNoticeList(NoticeVO vo) {
		return noticeDAO.mainNoticeList(vo); 
	}
}
