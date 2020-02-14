package board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//목록
	public List<BoardVO> boardList(BoardVO vo) {
		return sqlSession.selectList("board.list", vo);
	}
	//목록 카운트
	public int boardCount(BoardVO vo) {
		return sqlSession.selectOne("board.pageCount_board", vo);
	}
	//작성
	public int boardInsert(BoardVO vo) {
		return sqlSession.insert("board.board_insert", vo);
	}
	
	//상세
	public BoardVO boardView(int post_id) {
		return sqlSession.selectOne("board.board_view", post_id);
	}
	
	//조회수
	public void boardViewUpdate(int post_id) {
		sqlSession.update("board.boardUpdateReadcount", post_id);
	}
	
	//수정
	public int boardUpdate(BoardVO vo) {
		return sqlSession.update("board.board_update", vo);
	}
	
	//삭제
	public int boardDelete(int post_id) {
		return sqlSession.delete("board.board_delete", post_id);
	}
	
	//카테고리 삭제로 인한 게시판 글삭제
	public int allBoard_delete(int category_id) {
		return sqlSession.delete("board.allBoard_delete", category_id);
	}
	
	//보드메인 리스트
	public List<BoardVO> mainBoardList(BoardVO vo) {
		return sqlSession.selectList("board.main_board", vo);
	}
}
