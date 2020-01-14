package board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BoardVO> boardList(BoardVO vo) {
		return sqlSession.selectList("test.selectBoard", vo);
	}
	
	public int boardInsert(BoardVO vo) {
		return sqlSession.insert("test.insertBoard", vo);
	}
	
	public BoardVO boardDetail(int id) {
		return sqlSession.selectOne("test.detailBoard", id);
	}
	
	public int boardUpdate(BoardVO vo) {
		return sqlSession.update("test.updateBoard", vo);
	}
	
	public int boardDelete(int id) {
		return sqlSession.delete("test.deleteBoard", id);
	}
	
	public BoardVO loginCheck(HashMap hm) {
		return sqlSession.selectOne("test.loginCheck", hm);
	}
	
	
	
	
	
	
	
	
	
}
