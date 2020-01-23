package spotCategory;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spotCategory.SpotCategoryVO;

@Repository
public class SpotCategoryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 전체 목록
	public List<SpotCategoryVO> spotCategoryList(SpotCategoryVO vo){
		return sqlSession.selectList("spotCategory.spotCategoryList",vo);
	}
	

	//목록만 가져오는게 아니라 전체 카운트 해야함

	public SpotCategoryVO spotCategoryView(int num) {
		//sqlSession.update("dog.updateReadcount",id); 조회수를 여기다가 두면 수정 할때에도 
		return sqlSession.selectOne("spotCategory.spotCategoryView",num);
	}

	public int spotCategoryInsert(SpotCategoryVO vo) {
		return sqlSession.insert("spotCategory.spotCategoryInsert",vo);
	}
	
	public int spotCategoryUpdate(SpotCategoryVO vo) {
		return sqlSession.update("spotCategory.spotCategoryUpdate", vo);
	}

	public int spotCategoryDelete(int num) {
		return sqlSession.delete("spotCategory.spotCategoryDelete",num);
	}
}
