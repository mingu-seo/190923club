package spot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class SpotService {

	@Autowired
	private SpotDAO spotDao;
	
	public int nameCheck(String name) {
		return spotDao.nameCheck(name);
	}
	public int spotInsert(SpotVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/images/"));
		vo.setFile(fu.fileName);
		int r = spotDao.spotInsert(vo);
		return r;
	}
	public int insert(SpotVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
