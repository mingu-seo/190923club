package reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
