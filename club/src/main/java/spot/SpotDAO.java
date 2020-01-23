package spot;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpotDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int nameCheck(String name) {
		return sqlSession.selectOne("spot.nameCheck", name);
	}
	

	public int spotInsert(SpotVO vo) {
		return sqlSession.insert("spot.spotInsert",vo);
	}
}
