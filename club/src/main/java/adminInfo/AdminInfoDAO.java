package adminInfo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spotCategory.SpotCategoryVO;

@Repository
public class AdminInfoDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 전체 목록
	public List<AdminInfoVO> adminInfoList(AdminInfoVO infovo){
		return sqlSession.selectList("adminInfo.adminInfoList",infovo);
	}
	

	//목록만 가져오는게 아니라 전체 카운트 해야함

	public AdminInfoVO adminInfoView(int num) {
		//sqlSession.update("dog.updateReadcount",id); 조회수를 여기다가 두면 수정 할때에도 
		return sqlSession.selectOne("adminInfo.adminInfoView",num);
	}

	public int adminInfoInsert(AdminInfoVO infovo) {
		return sqlSession.insert("adminInfo.adminInfoInsert",infovo);
	}
	
	public int adminInfoUpdate(AdminInfoVO infovo) {
		return sqlSession.update("adminInfo.adminInfoUpdate", infovo);
	}

	public int adminInfoDelete(int num) {
		return sqlSession.delete("adminInfo.adminInfoDelete",num);
	}


}
