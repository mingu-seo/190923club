package file;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class FileService {

	@Autowired
	FileDAO fileDAO;
	
	//파일 저장
	public int fileInsert(FileVO vo, MultipartFile file, HttpServletRequest req) {
		
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, req.getRealPath("/upload/"));
		vo.setServer_name(fu.fileName);
		vo.setFront_name(fu.orgName);
		
		return fileDAO.fileInsert(vo);
	}
	
	//파일 선택
	public FileVO fileSelect(FileVO vo) {
		return fileDAO.fileSelect(vo);
	}
}
