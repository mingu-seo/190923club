package notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 목록
	public List<NoticeVO> noticeList(NoticeVO vo, int board_id) {
		return sqlSession.selectList("board.notice_list", vo);
	}
	//공지사항 글작성
	public int noticeInsert(NoticeVO vo, int board_id) {
		return sqlSession.insert("board.notice_insert", vo);
	}
	//공지사항 상세
	public NoticeVO noticeView(int post_id, @RequestParam("board_id")int board_id) {
		return sqlSession.selectOne("board.notice_view", post_id);
	}
	//공지사항 삭제
	public int noticeDelete(int post_id) {
		return sqlSession.delete("board.notice_delete", post_id);
	}
	//공지사항 수정
	public int noticeUpdate(NoticeVO vo) {
		return sqlSession.update("board.notice_update", vo);
	}
	
}
