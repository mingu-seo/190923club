package adminNotice;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminNoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시글 전체 목록
	public List<AdminNoticeVO> adminNoticeList(AdminNoticeVO vo){
		return sqlSession.selectList("adminNotice.adminNoticeList",vo);
	}
	

	//목록만 가져오는게 아니라 전체 카운트 해야함
	
	public int count(AdminNoticeVO vo) {
		return sqlSession.selectOne("adminNotice.count",vo);
	}

	public AdminNoticeVO adminNoticeView(int notice_num) {
		//sqlSession.update("dog.updateReadcount",id); 조회수를 여기다가 두면 수정 할때에도 
		return sqlSession.selectOne("adminNotice.adminNoticeView",notice_num);
	}

	public int amdinNoticeInsert(AdminNoticeVO vo) {
		return sqlSession.insert("adminNotice.adminNoticeInsert",vo);
	}
	
	public int maxNoticeNum() {
		return sqlSession.selectOne("adminNotice.maxNoticeNum");
	}
	public int amdinNoticeUpdate(AdminNoticeVO vo) {
		return sqlSession.update("adminNotice.adminNoticeUpdate", vo);
	}

	public int amdinNoticeDelete(int notice_num) {
		return sqlSession.delete("adminNotice.adminNoticeDelete",notice_num);
	}
	
	public void updateReadcount(int notice_num) {
		sqlSession.update("adminNotice.updateReadcount",notice_num);
	}	
}
