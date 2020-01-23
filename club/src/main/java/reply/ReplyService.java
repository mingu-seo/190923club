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
		//원글의 seq보다 크고, ref가 같은 모든 글의 seq+1
		//vo에다가 ref=원글의 ref, lev=원글의 lev+1, seq=원글의 seq+1
		//insert
		vo.setG_lev(vo.getG_lev()+1);
		vo.setG_seq(vo.getG_seq()+1);
		
		return replyDao.replyInsert(vo);
	}

}
