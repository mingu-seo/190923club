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
	public BoardVO boardView(int post_id) {
		boardDAO.boardViewUpdate(post_id);
		return boardDAO.boardView(post_id);
	}
	public int boardUpdate(BoardVO vo) {
		return boardDAO.boardUpdate(vo);
	}
	public int boardDelete(int post_id) {
		return boardDAO.boardDelete(post_id);
	}
	//카테고리 삭제로 인한 게시판 글삭제
	public int allBoard_delete(int category_id) {
		return boardDAO.allBoard_delete(category_id);
	}
	public List<BoardVO> mainBoardList(BoardVO vo) {
		return boardDAO.mainBoardList(vo);
	}
	
}
