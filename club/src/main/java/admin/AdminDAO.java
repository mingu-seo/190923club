package admin;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
		
	public int idCheck(String id) {
		return sqlSession.selectOne("admin.idCheck", id);
	}
	
	public int insert(AdminVO vo) {
		return sqlSession.insert("admin.insert", vo);
	}
}
