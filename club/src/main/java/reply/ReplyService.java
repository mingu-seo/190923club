package reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.NoticeVO;

@Service
public class ReplyService {

	@Autowired
	ReplyDAO replyDao;
	
	public List<ReplyVO> replyList(NoticeVO vo) {
		List<ReplyVO> list = replyDao.replyList(vo);
		return list;
	}
	
	public int replyInsert(ReplyVO vo) {
		return replyDao.replyInsert(vo);
	}
}
