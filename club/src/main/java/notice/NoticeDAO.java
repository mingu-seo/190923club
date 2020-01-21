package notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 목록
	public List<NoticeVO> noticeList(NoticeVO vo) {
		return sqlSession.selectList("board.notice_list", vo);
	}
	//공지사항 글작성
	public int noticeInsert(NoticeVO vo) {
		return sqlSession.insert("board.notice_insert", vo);
	}
	//공지사항 상세
	public NoticeVO noticeView(int post_id) {
		return sqlSession.selectOne("board.notice_view", post_id);
	}
	//공지사항 삭제
	public int noticeDelete(int post_id) {
		return sqlSession.delete("board.notice_delete", post_id);
	}
	
}
