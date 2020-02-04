package like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	@Autowired
	LikeDAO likeDao;
	
	public int likeInsert(LikeVO vo) {
		return likeDao.likeInsert(vo);
	}
	
	public int likeDelete(LikeVO vo) {
		return likeDao.likeDelete(vo);
	}
}
