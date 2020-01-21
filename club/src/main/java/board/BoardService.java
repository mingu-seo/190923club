package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
