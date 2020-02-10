package category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int categoryInsert(CategoryVO vo) {
		return sqlSession.insert("category.cg_insert", vo);
	}
	//갤러리 리스트
	public List<CategoryVO> gCategoryList(CategoryVO vo) {
		return sqlSession.selectList("category.gcg_list", vo);
	}
	//자유게시판 리스트
	public List<CategoryVO> wCategoryList(CategoryVO vo) {
		return sqlSession.selectList("category.wcg_list", vo);
	}
	//공지사항 리스트
	public List<CategoryVO> nCategoryList(CategoryVO vo) {
		return sqlSession.selectList("category.ncg_list", vo);
	}
}
