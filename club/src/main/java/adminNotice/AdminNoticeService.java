package adminNotice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class AdminNoticeService {

	@Autowired
	AdminNoticeDAO adminNoticeDao;
	
	public List<AdminNoticeVO> adminNoticeList(AdminNoticeVO vo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<AdminNoticeVO> list = adminNoticeDao.adminNoticeList(vo);
		return list;
	}
	

	
	public int[] count(AdminNoticeVO vo) {
		int listCount = adminNoticeDao.count(vo);  //전체 갯수
		int totalpage = listCount / 10;		// 총페이지수
		if(listCount % 10 > 0) totalpage ++;
		
		int[] pageCount = new int[2];
		pageCount[0] = listCount;
		pageCount[1] = totalpage;
		
		return pageCount;		
	}
	
	//수정페이지에서는 조회수 증가못하도록 따로 분리해아함
	public AdminNoticeVO adminNoticeView(int num) {
		adminNoticeDao.updateReadcount(num);
		return adminNoticeDao.adminNoticeView(num);
	}

	
	public AdminNoticeVO adminNoticeUpdateForm(int num) {
		return adminNoticeDao.adminNoticeView(num);
	}
	
	public int adminNoticeInsert(AdminNoticeVO vo , MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		vo.setFile(fu.fileName);
		int maxNum = adminNoticeDao.maxNoticeNum();
		vo.setRe_ref(maxNum);
		int r = adminNoticeDao.amdinNoticeInsert(vo);
		return r;
	}
	
	public int amdinNoticeUpdate(AdminNoticeVO vo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setFile(fu.fileName);
		}
		int r = adminNoticeDao.amdinNoticeUpdate(vo);
		return r;
	}
	
	public int amdinNoticeDelete(int num) {
		int r = adminNoticeDao.amdinNoticeDelete(num);
		return r;
	}

}
