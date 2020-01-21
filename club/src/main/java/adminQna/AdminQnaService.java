package adminQna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class AdminQnaService {

	@Autowired
	AdminQnaDAO adminQnaDao;
	
	public List<AdminQnaVO> adminQnaList(AdminQnaVO vo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<AdminQnaVO> list = adminQnaDao.adminQnaList(vo);
		return list;
	}
	

	
	public int[] count(AdminQnaVO vo) {
		int listCount = adminQnaDao.count(vo);  //전체 갯수
		int totalpage = listCount / 10;		// 총페이지수
		if(listCount % 10 > 0) totalpage ++;
		
		int[] pageCount = new int[2];
		pageCount[0] = listCount;
		pageCount[1] = totalpage;
		
		return pageCount;		
	}
	
	//수정페이지에서는 조회수 증가못하도록 따로 분리해아함
	public AdminQnaVO adminQnaView(int qna_num) {
		adminQnaDao.updateReadcount(qna_num);
		return adminQnaDao.adminQnaView(qna_num);
	}

	
	public AdminQnaVO adminQnaUpdateForm(int qna_num) {
		return adminQnaDao.adminQnaView(qna_num);
	}
	
	public int adminQnaInsert(AdminQnaVO vo , MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		vo.setQna_file(fu.fileName);
		int maxNum = adminQnaDao.maxQnaNum();
		vo.setQna_re_ref(maxNum);
		int r = adminQnaDao.amdinQnaInsert(vo);
		return r;
	}
	
	public int amdinQnaUpdate(AdminQnaVO vo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setQna_file(fu.fileName);
		}
		int r = adminQnaDao.amdinQnaUpdate(vo);
		return r;
	}
	
	public int amdinQnaDelete(int nna_num) {
		int r = adminQnaDao.amdinQnaDelete(nna_num);
		return r;
	}

}
