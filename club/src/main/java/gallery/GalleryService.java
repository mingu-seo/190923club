package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int galleryInsert(GalleryVO vo, MultipartFile file, MultipartFile file2, MultipartFile file3, HttpServletRequest request, int board_id) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/"));
		vo.setImage(fu.fileName);
		
		fu.fileUpload(file2, request.getRealPath("/upload/"));
		vo.setImage2(fu.fileName);
		
		fu.fileUpload(file3, request.getRealPath("/upload/"));
		vo.setImage3(fu.fileName);
		return galleryDao.galleryInsert(vo);
	}
	
	public GalleryVO galleryView(int id) {
		galleryDao.galleryViewUpdate(id);
		return galleryDao.galleryView(id);
	}
	public GalleryVO galleryPre(int id) {
		galleryDao.galleryViewUpdate(id);
		return galleryDao.galleryPre(id);
	}
	public GalleryVO galleryNext(int id) {
		galleryDao.galleryViewUpdate(id);
		return galleryDao.galleryNext(id);
	}
	
	public int galleryDelete(GalleryVO vo,int board_id) {
		return galleryDao.galleryDelete(vo, board_id);
	}
	
	public int galleryUpdate(GalleryVO vo, MultipartFile file, MultipartFile file2, MultipartFile file3, HttpServletRequest request, int board_id) {
		FileUtil fu = new FileUtil();
		FileUtil fu2 = new FileUtil();
		FileUtil fu3 = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/"));
		vo.setImage(fu.fileName);
		
		fu2.fileUpload(file2, request.getRealPath("/upload/"));
		vo.setImage2(fu2.fileName);
		
		fu3.fileUpload(file3, request.getRealPath("/upload/"));
		vo.setImage3(fu3.fileName);
		
		return galleryDao.galleryUpdate(vo, board_id);
	}
	public int galleryUpgrade(int post_id, String cname) {
		Map map = new HashMap();
		map.put("post_id", post_id);
		map.put("cname", cname);
		
		return galleryDao.galleryUpgrade(map);
	}

	public List<GalleryVO> mainGalleryList(GalleryVO vo) {
		return galleryDao.mainGalleryList(vo); 
	}
	

	
	
}
