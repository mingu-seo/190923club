package category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//카테고리 이름 조회
	public CategoryVO cateName_select(int category_id) {
		return sqlSession.selectOne("category.cateName_select", category_id);
	}
	//카테고리 생성
	public int categoryInsert(CategoryVO vo) {
		return sqlSession.insert("category.cg_insert", vo);
	}
	//카테고리 삭제
	public int categoryDelete(CategoryVO vo) {
		return sqlSession.delete("category.cg_delete", vo);
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
	
	public CategoryVO cateMin_num(int spot_num) {
		return sqlSession.selectOne("category.cg_min", spot_num);
	}
}
