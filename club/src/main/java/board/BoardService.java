package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class BoardService {

	@Autowired 
	BoardDAO boardDAO;
	
	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = boardDAO.boardList(vo);
		return list;
	}
	
	public int boardInsert(BoardVO vo) {
		return boardDAO.boardInsert(vo);
	}
	public BoardVO boardView(int id_post) {
		return boardDAO.boardView(id_post);
	}
	
	public List<BoardVO> galleryList(BoardVO vo) {
		List<BoardVO> list = boardDAO.galleryList(vo);
		return list;
	}
	
	public int galleryInsert(BoardVO vo, MultipartFile file, int id_board, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/"));
		vo.setImage(fu.fileName);
		return boardDAO.galleryInsert(vo);
	}
}
