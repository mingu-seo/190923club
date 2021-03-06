package notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//목록
	public List<NoticeVO> noticeList(NoticeVO vo) {
		return sqlSession.selectList("board.notice_list", vo);
	}
	//목록 카운트
	public int count(NoticeVO vo) {
		return sqlSession.selectOne("board.count", vo);
	}
	//글작성
	public int noticeInsert(NoticeVO vo) {
		sqlSession.insert("board.notice_insert", vo);
		return vo.getPost_id();
	}
	//상세
	public NoticeVO noticeView(NoticeVO vo) {
		return sqlSession.selectOne("board.notice_view", vo);
	}
	//삭제
	public int noticeDelete(int post_id) {
		return sqlSession.delete("board.notice_delete", post_id);
	}
	//수정
	public int noticeUpdate(NoticeVO vo) {
		return sqlSession.update("board.notice_update", vo);
	}
	//조회수
	public void noticeViewUpdate(int post_id) {
		sqlSession.update("board.updateReadcount", post_id);
	}
	//보드메인 공지사항 리스트
	public List<NoticeVO> mainNoticeList(NoticeVO vo) {
		return sqlSession.selectList("board.main_notice", vo);
	}
	
	
	
}
