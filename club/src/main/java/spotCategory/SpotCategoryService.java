package spotCategory;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spotCategory.SpotCategoryVO;
import util.FileUtil;

@Service
public class SpotCategoryService {

	
	@Autowired
	SpotCategoryDAO spotCategoryDao;
	
	public  List<SpotCategoryVO> spotCategoryList(SpotCategoryVO vo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<SpotCategoryVO> list = spotCategoryDao.spotCategoryList(vo);
		return list;
	}
	
	public SpotCategoryVO spotCategoryView(int num) {
		return spotCategoryDao.spotCategoryView(num);
	}

	
	public SpotCategoryVO spotCategoryUpdateForm(int num) {
		return spotCategoryDao.spotCategoryView(num);
	}
	
	public int spotCategoryInsert(SpotCategoryVO vo , MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		vo.setFile(fu.fileName);

		int r = spotCategoryDao.spotCategoryInsert(vo);
		return r;
	}
	
	public int spotCategoryUpdate(SpotCategoryVO vo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setFile(fu.fileName);
		}
		int r = spotCategoryDao.spotCategoryUpdate(vo);
		return r;
	}
	
	public int spotCategoryDelete(int num) {
		int r = spotCategoryDao.spotCategoryDelete(num);
		return r;
	}

}
