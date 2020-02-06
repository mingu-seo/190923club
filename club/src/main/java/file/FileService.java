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
	
	//파일 수정
	public int fileUpdate(FileVO vo, MultipartFile file, HttpServletRequest req) {
		
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, req.getRealPath("/upload/"));
		vo.setServer_name(fu.fileName);
		vo.setFront_name(fu.orgName);
		//파일이 공백이 아니라면, 즉 파일을 다시 선택했을 때
		if (!file.isEmpty()) {
			System.out.println("여기되나?");
			return fileDAO.fileUpdate(vo);
		} else {
			return 0;
		}
	}
}
