package gallery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class GalleryService {

	@Autowired
	GalleryDAO galleryDao;
	
	public List<GalleryVO> galleryList(GalleryVO vo) {
		List<GalleryVO> list = galleryDao.galleryList(vo);
		return list;
	}
	
	public int galleryInsert(GalleryVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/"));
		vo.setImage(fu.fileName);
		return galleryDao.galleryInsert(vo);
	}
}
