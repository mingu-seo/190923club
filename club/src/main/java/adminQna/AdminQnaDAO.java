package adminQna;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminQnaDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 전체 목록
	public List<AdminQnaVO> adminQnaList(AdminQnaVO vo){
		return sqlSession.selectList("adminQna.adminQnaList",vo);
	}
	

	//목록만 가져오는게 아니라 전체 카운트 해야함
	
	public int count(AdminQnaVO vo) {
		return sqlSession.selectOne("adminQna.count",vo);
	}

	public AdminQnaVO adminQnaView(int num) {
		//sqlSession.update("dog.updateReadcount",id); 조회수를 여기다가 두면 수정 할때에도 
		return sqlSession.selectOne("adminQna.adminQnaView",num);
	}

	public int amdinQnaInsert(AdminQnaVO vo) {
		return sqlSession.insert("adminQna.adminQnaInsert",vo);
	}
	
	public int maxQnaNum() {
		return sqlSession.selectOne("adminQna.maxQnaNum");
	}
	public int amdinQnaUpdate(AdminQnaVO vo) {
		return sqlSession.update("adminQna.adminQnaUpdate", vo);
	}

	public int amdinQnaDelete(int num) {
		return sqlSession.delete("adminQna.adminQnaDelete",num);
	}
	
	public void updateReadcount(int num) {
		sqlSession.update("adminQna.updateReadcount",num);
	}


	public int replySeq(AdminQnaVO vo) {
		return sqlSession.update("adminQna.replySeq", vo);
	}


	public int replyInsert(AdminQnaVO vo) {
		return sqlSession.insert("adminQna.replyInsert",vo);
	}	
	
	
}
