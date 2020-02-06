package gallery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import notice.NoticeVO;



@Repository
public class GalleryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		//갤러리 리스트
		public List<GalleryVO> galleryList(GalleryVO vo) {
			return sqlSession.selectList("board.gallery_list", vo);
		}
		
		//갤러리 글 작성
		public int galleryInsert(GalleryVO vo) {
			return sqlSession.insert("board.gallery_insert",vo);
		}

		//갤러리 상세
		public GalleryVO galleryView(int id) {
			return sqlSession.selectOne("board.gallery_view", id);
		}

		public GalleryVO galleryPre(int id) {
			return sqlSession.selectOne("board.gallery_pre", id);
		}
		public GalleryVO galleryNext(int id) {
			return sqlSession.selectOne("board.gallery_next", id);
		}
		
		public int galleryDelete(GalleryVO vo) {
			return sqlSession.delete("board.gallery_delete",vo);
		}
		
		public int galleryUpdate(GalleryVO vo) {
			return sqlSession.update("board.gallery_update",vo);
		}
		public int galleryCount(GalleryVO vo) {
			return sqlSession.update("board.galleryCount",vo);
		}

		public List<GalleryVO> mainGalleryList(GalleryVO vo) {
			return sqlSession.selectList("board.main_gallery", vo);
		}

		//조회수
		public void galleryViewUpdate(int post_id) {
			sqlSession.update("board.updateRead", post_id);
		}
}
