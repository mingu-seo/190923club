package joinSpot;

import java.util.List;

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
}
