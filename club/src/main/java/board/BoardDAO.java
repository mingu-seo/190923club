package board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BoardVO> boardList(BoardVO vo) {
		return sqlSession.selectList("board.list", vo);
	}
	
	public int boardInsert(BoardVO vo) {
		return sqlSession.insert("board.board_insert", vo);
	}
	
	
	
	
}
