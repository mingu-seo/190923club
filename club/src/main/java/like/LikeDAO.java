package like;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	//좋아요 조회 (리턴타입)
	public LikeVO like_select(LikeVO vo) {
		return sqlSession.selectOne("like.like_select", vo);
	}
	
	//좋아요 인서트
	public int likeInsert(LikeVO vo) {
		return sqlSession.insert("like.like_insert", vo);
	}
	//좋아요 취소
	public int likeDelete(LikeVO vo) {
		return sqlSession.delete("like.like_delete", vo);
	}
	//
	
	public int like_up(Map map) {
		return sqlSession.update("like.like_up", map);
	}
	public int like_down(Map map) {
		return sqlSession.update("like.like_down", map);
	}
	
}
