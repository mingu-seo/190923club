package reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import gallery.GalleryVO;
import notice.NoticeVO;

=======
>>>>>>> branch 'master' of https://github.com/mingu-seo/190923club.git
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
	
<<<<<<< HEAD
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
	
=======
	public int replyDelete(int reply_num) {
		return sqlSession.delete("reply.re_delete", reply_num);
	}

>>>>>>> branch 'master' of https://github.com/mingu-seo/190923club.git
}
