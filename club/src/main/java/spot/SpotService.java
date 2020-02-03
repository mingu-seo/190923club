package spot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spot.SpotVO;
import util.FileUtil;

@Service
public class SpotService {

	@Autowired
	private SpotDAO spotDao;
	
	public int nameCheck(String name) {
		return spotDao.nameCheck(name);
	}
	public int spotInsert(SpotVO spotvo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		spotvo.setFile(fu.fileName);
		int r = spotDao.spotInsert(spotvo);
		return r;
	}
	public  List<SpotVO> spotList(SpotVO spotvo){
		//VO에다가 사용자가 요청한 p를 넣는 작업을 여기서함
		List<SpotVO> list = spotDao.spotList(spotvo);
		return list;
	}
	
	public SpotVO spotView(int num) {
		return spotDao.spotView(num);
	}

	
	public SpotVO spotUpdateForm(int num) {
		return spotDao.spotView(num);
	}
	
	public int spotUpdate(SpotVO spotvo, MultipartFile file, HttpServletRequest request ) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			spotvo.setFile(fu.fileName);
		}
		int r = spotDao.spotUpdate(spotvo);
		return r;
	}
	
	public int spotDelete(int num) {
		int r = spotDao.spotDelete(num);
		return r;
	}
	public int insert(SpotVO spotvo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
