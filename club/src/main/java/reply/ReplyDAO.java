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
	
	public List<ReplyVO> replyList(ReplyVO vo) {
		return sqlSession.selectList("reply.re_list", vo);
	}
	
	public int maxGid() {
		return sqlSession.selectOne("reply.maxGid");
	}
	//댓글
	public int replyInsert(ReplyVO vo) {
		return sqlSession.insert("reply.re_insert", vo);
	}
	//댓글의 답변
	public int replyReplyInsert(ReplyVO vo) {
		return sqlSession.insert("reply.reRe_insert", vo);
	}
	
	
	public ReplyVO replyView(int id) {
		return sqlSession.selectOne("reply.review", id);
	}
	
	
	public int replyDelete(int reply_num) {
		return sqlSession.delete("reply.re_delete", reply_num);
	}
	public int replySeq(ReplyVO vo) {
		return sqlSession.update("reply.replySeq", vo);
	}

}
