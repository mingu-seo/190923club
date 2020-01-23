package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	public List<NoticeVO> noticeList(NoticeVO vo, int board_id) {
		List<NoticeVO> list = noticeDAO.noticeList(vo, board_id);
		return list;
	}
	
	public int noticeInsert(NoticeVO vo, MultipartFile file, HttpServletRequest req, int board_id) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, req.getRealPath("/upload/"));
		vo.setFile(fu.fileName);
		return noticeDAO.noticeInsert(vo, board_id);
	}
	
	public NoticeVO noticeView(int post_id, int board_id) {
		return noticeDAO.noticeView(post_id, board_id);
	}
	
	public int noticeDelete(int post_id) {
		return noticeDAO.noticeDelete(post_id);
	}
	
	public NoticeVO noticeUpdateForm(int post_id, int board_id) {
		return noticeDAO.noticeView(post_id, board_id);
	}
	
	public int noticeUpdate(NoticeVO vo, MultipartFile file, HttpServletRequest req) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, req.getRealPath("/upload/"));
		vo.setFile(fu.fileName);
		return noticeDAO.noticeUpdate(vo);
	}
}
