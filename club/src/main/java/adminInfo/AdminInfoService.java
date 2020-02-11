package adminInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spotCategory.SpotCategoryVO;
import util.FileUtil;

@Service
public class AdminInfoService {

	
	@Autowired
	AdminInfoDAO AdminInfoDao;
	
	public  List<AdminInfoVO> adminInfoList(AdminInfoVO infovo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<AdminInfoVO> list = AdminInfoDao.adminInfoList(infovo);
		return list;
	}
	
	public AdminInfoVO adminInfoView(int num) {
		return AdminInfoDao.adminInfoView(num);
	}

	
	public AdminInfoVO adminInfoUpdateForm(int num) {
		return AdminInfoDao.adminInfoView(num);
	}
	
	public int adminInfoInsert(AdminInfoVO infovo , MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		infovo.setFile(fu.fileName);

		int r = AdminInfoDao.adminInfoInsert(infovo);
		return r;
	}
	
	public int adminInfoUpdate(AdminInfoVO infovo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			infovo.setFile(fu.fileName);
		}
		int r = AdminInfoDao.adminInfoUpdate(infovo);
		return r;
	}
	
	public int adminInfoDelete(int num) {
		int r = AdminInfoDao.adminInfoDelete(num);
		return r;
	}


}
