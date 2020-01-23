package board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//자유게시판 리스트
	public List<BoardVO> boardList(BoardVO vo) {
		return sqlSession.selectList("board.list", vo);
	}
	
	//자유게시판 글 작성
	public int boardInsert(BoardVO vo) {
		return sqlSession.insert("board.board_insert", vo);
	}
	
	//자유게시판 글 상세
	public BoardVO boardView(int id_post) {
		return sqlSession.selectOne("board.board_view", id_post);
	}
	
	//자유게시판 글삭제
	public int boardDelete(int post_id) {
		return sqlSession.delete("board.board_delete", post_id);
	}
}
