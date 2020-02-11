package like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	@Autowired
	LikeDAO likeDao;
	
	public LikeVO like_select(LikeVO vo) {
		return likeDao.like_select(vo);
	}
	
	public int likeInsert(LikeVO vo) {
		return likeDao.likeInsert(vo);
	}
	public int likeDelete(LikeVO vo) {
		return likeDao.likeDelete(vo);
	}
	
	public void like_up(boolean upDown, String tableName, int board_id, int post_id) {
		Map map = new HashMap();
		map.put("tableName", tableName);
		map.put("board_id", board_id);
		map.put("post_id", post_id);
		
		if (upDown) {
			likeDao.like_up(map);
		} else {
			likeDao.like_down(map);
		}
	}

}
