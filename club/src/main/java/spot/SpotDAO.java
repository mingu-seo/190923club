package spot;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spot.SpotVO;

@Repository
public class SpotDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int nameCheck(String name) {
		return sqlSession.selectOne("spot.nameCheck", name);
	}
	public int spotInsert(SpotVO spotvo) {
		return sqlSession.insert("spot.spotInsert",spotvo);
	}
	// SPOT 전체 목록
	public List<SpotVO> spotList(SpotVO spotvo){
		return sqlSession.selectList("spot.spotList",spotvo);
	}
	
	public SpotVO spotView(int num) {
		return sqlSession.selectOne("spot.spotView",num);
	}
	
	public int spotUpdate(SpotVO spotvo) {
		return sqlSession.update("spot.spotUpdate", spotvo);
	}

	public int spotDelete(int num) {
		return sqlSession.delete("spot.spotDelete",num);
	}
}
