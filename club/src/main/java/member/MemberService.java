package member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	// 회원가입
	public int idCheck(String id) {
		return memberDAO.idCheck(id);
	}
	
	public int memberInsert(MemberVO vo) {
		return memberDAO.memberInsert(vo);
	}


	
	// 유저 로그인
	public MemberVO userLogin(MemberVO vo) {
		return memberDAO.userLogin(vo);
	}


	// 마이페이지
	public MemberVO mypageView(int id) {
		return memberDAO.mypageView(id);
	}
	public int mypageUpdate(MemberVO vo, MultipartFile file, HttpServletRequest req) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, req.getRealPath("/profileImg/"));
		vo.setProfile(fu.fileName);
		return memberDAO.mypageUpdate(vo);
	}
	
	
	// 페이징 처리
	public int[] pageCount(MemberVO vo) {
		int listcount = memberDAO.count(vo);	// 전체 갯수  
		int totalpage = listcount / 10;		// 총 페이지 수 
		if(listcount % 10 > 0) totalpage++;
		
		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;
		
		return pagecount;
	}

	
	// admin 페이지 회원 리스트
	public List<MemberVO> MemberList(MemberVO vo){
		return memberDAO.MemberList(vo);
	}
	
	
	// admin 페이지 회원 휴면
	public int memberSleep(MemberVO vo){
		return memberDAO.memberSleep(vo);
	}

	
	// admin 페이지 회원 활성화
	public int memberWake(MemberVO vo){
		return memberDAO.memberWake(vo);
	}

	
	// admin 페이지 회원 삭제
	public int memberDelete(MemberVO vo){
		return memberDAO.memberDelete(vo);
	}
	
	
	// 마이페이지 내가 쓴글
	public List<Map> mypageWritten(MemberVO searchvo) {
		return memberDAO.mypageWritten(searchvo);
	}
	public int[] mypageWrittenCount(MemberVO searchvo) {
		int listcount = memberDAO.mypageWrittenCount(searchvo);	// 전체 갯수  
		int totalpage = listcount / 10;		// 총 페이지 수 
		if(listcount % 10 > 0) totalpage++;
		
		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;
		
		return pagecount;
	}
}
