package like;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//좋아요 인서트
	public int likeInsert(LikeVO vo) {
		return sqlSession.insert("like.like_insert", vo);
	}
	//좋아요 취소
	public int likeDelete(LikeVO vo) {
		return sqlSession.delete("like.like_delete", vo);
	}
}
