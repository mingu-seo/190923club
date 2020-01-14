package board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {

	public int boardInsert(BoardVO vo, HttpServletRequest request);
	public BoardVO boardDetail(int id);
	public int boardUpdate(BoardVO vo, MultipartFile file, HttpServletRequest request);
	public int boardDelete(int id);
	
}
