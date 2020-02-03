package reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gallery.GalleryVO;
import notice.NoticeVO;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ReplyVO> replyList(NoticeVO vo) {
		return sqlSession.selectList("reply.re_list", vo);
	}
	
	public int replyInsert(ReplyVO vo) {
		return sqlSession.insert("reply.re_insert", vo);
	}
	
	//댓글 리스트
	public List<ReplyVO> replyList(ReplyVO vo) {
		return sqlSession.selectList("reply.relist", vo);
			}
	
	public ReplyVO replyView(int id) {
		return sqlSession.selectOne("reply.review", id);
	}
	
	
	public int replyDelete(ReplyVO vo) {
		return sqlSession.delete("reply.re_delete",vo);
	}
	
}
