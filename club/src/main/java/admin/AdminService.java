package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDao;
	
	
	public List<AdminVO> adminNoticeList(AdminVO vo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<AdminVO> list = adminDao.adminNoticeList(vo);
		return list;
	}
	
	public int[] count(AdminVO vo) {
		int listCount = adminDao.count(vo);  //전체 갯수
		int totalpage = listCount / 10;		// 총페이지수
		if(listCount % 10 > 0) totalpage ++;
		
		int[] pageCount = new int[2];
		pageCount[0] = listCount;
		pageCount[1] = totalpage;
		
		return pageCount;		
	}
	
	//수정페이지에서는 조회수 증가못하도록 따로 분리해아함
	public AdminVO adminNoticeView(int notice_num) {
		adminDao.updateReadcount(notice_num);
		return adminDao.adminNoticeView(notice_num);
	}

	
	public AdminVO adminNoticeUpdateForm(int notice_num) {
		return adminDao.adminNoticeView(notice_num);
	}
	
	public int adminNoticeInsert(AdminVO vo , MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		vo.setNotice_file(fu.fileName);
		int maxNum = adminDao.maxNoticeNum();
		vo.setNotice_re_ref(maxNum);
		int r = adminDao.amdinNoticeInsert(vo);
		return r;
	}
	
	public int amdinNoticeUpdate(AdminVO vo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setNotice_file(fu.fileName);
		}
		int r = adminDao.amdinNoticeUpdate(vo);
		return r;
	}
	
	public int amdinNoticeDelete(int notice_num) {
		int r = adminDao.amdinNoticeDelete(notice_num);
		return r;
	}

}
