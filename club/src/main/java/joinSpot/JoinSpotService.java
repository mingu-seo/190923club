package joinSpot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberDAO;
import member.MemberVO;

@Service
public class JoinSpotService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	JoinSpotDAO joinSpotDAO;
	
	@Autowired
	spot.SpotService spotDAO;
	
	// spot 가입
	public int joinSpot(JoinSpotVO jv) {
		
		return joinSpotDAO.joinSpot(jv);
	}
	
	
	// spot 회원 리스트
	public List<MemberVO> spotMemberList(MemberVO vo){
		return joinSpotDAO.spotMemberList(vo);
	}
	public int count(MemberVO vo){
		return joinSpotDAO.spotMemberCount(vo);
	}
	
	// 페이징 처리
	public int[] pageCount(MemberVO vo) {
		int listcount = joinSpotDAO.spotMemberCount(vo);	// 전체 갯수
		int totalpage = listcount / 10;		// 총 페이지 수 
		if(listcount % 10 > 0) totalpage++;
		
		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;
		
		return pagecount;
	}
	
	
	// spot 회원 휴면
	public int spotMemberSleep(JoinSpotVO jv){
		return joinSpotDAO.spotMemberSleep(jv);
	}

	
	// spot 회원 활성화
	public int spotMemberWake(JoinSpotVO jv){
		return joinSpotDAO.spotMemberWake(jv);
	}

	
	// spot 회원 강제탈퇴
	public int spotMemberDelete(JoinSpotVO jv){
		return joinSpotDAO.spotMemberDelete(jv);
	}
	
	
	// spot 회원 체크
	public int checkJoinSpot(int member_num, int spot_num) {
		Map map = new HashMap();
		map.put("member_num", member_num);
		map.put("spot_num", spot_num);
		return joinSpotDAO.checkJoinSpot(map);
	}


	// 내가 가입한 spot 리스트   
	public List<MemberVO> mySpotList(MemberVO vo){
		return joinSpotDAO.mySpotList(vo);  
	}
	
	
	// spot 리더 가져오기
	public MemberVO spotLeader(MemberVO vo){
		return joinSpotDAO.spotLeader(vo);
	}
}
