package adminBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminBoardService {

	@Autowired 
	private AdminBoardDAO boardDAO;
	
	@Autowired
	private joinSpot.JoinSpotDAO jsDAO;
	
	//목록
	public List<AdminBoardVO> boardList(AdminBoardVO vo) {
		List<AdminBoardVO> list = boardDAO.boardList(vo);
		return list;
	}
	//페이징처리
	public int[] boardCount(AdminBoardVO vo) {
		int listcount = boardDAO.boardCount(vo);
		int totalpage = listcount / 10;
		if(listcount % 10 > 0) totalpage++;
		
		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;
		
		return pagecount;
	}
	//등록
	public int boardInsert(AdminBoardVO vo) {
		return boardDAO.boardInsert(vo);
	}
	//상세
	public AdminBoardVO boardView(int post_id) {
		boardDAO.boardViewUpdate(post_id);
		return boardDAO.boardView(post_id);
	}
	//수정
	public int boardUpdate(AdminBoardVO vo) {
		return boardDAO.boardUpdate(vo);
	}
	//삭제
	public int boardDelete(int post_id) {
		return boardDAO.boardDelete(post_id);
	}
	//카테고리 삭제로 인한 게시판 글삭제
	public int allBoard_delete(int category_id) {
		return boardDAO.allBoard_delete(category_id);
	}
	//보드메인리스트
	public List<AdminBoardVO> mainBoardList(AdminBoardVO vo) {
		return boardDAO.mainBoardList(vo);
	}
	//스팟에 가입한 사람인지 확인 여부
	public int checkJoinSpot(int member_num, int spot_num) {
		
		Map map = new HashMap();
		map.put("member_num", member_num);
		map.put("spot_num", spot_num);
		
		return jsDAO.checkJoinSpot(map);
	}
}
