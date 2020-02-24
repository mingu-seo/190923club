package member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 아이디 체크
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
	
	// 회원가입
	public int memberInsert(MemberVO vo){
		return sqlSession.insert("member.insertMember", vo);
	}
	
	
	// 유저 로그인
	public MemberVO userLogin(MemberVO vo) {
		return sqlSession.selectOne("member.userLogin", vo);
	}
	

	// 마이페이지 뷰
	public MemberVO mypageView(int num) {
		return sqlSession.selectOne("member.mypageView", num);
	}
	// 마이페이지수정
	public int mypageUpdate(MemberVO vo) {
		return sqlSession.update("member.mypageUpdate", vo);
	}
	
	
	// 페이징 처리
	public int count(MemberVO vo) {
		return sqlSession.selectOne("member.count", vo);  
	}

	
	// admin 페이지 회원 리스트
	public List<MemberVO> MemberList(MemberVO vo){  
		return sqlSession.selectList("member.memberList", vo);
	}
	
	
	// admin 페이지 회원 휴면
	public int memberSleep(MemberVO vo) {
		return sqlSession.update("member.memberSleep", vo);
	}

	
	// admin 페이지 회원 활성화
	public int memberWake(MemberVO vo) {
		return sqlSession.update("member.memberWake", vo);
	}
	
	
	// admin 페이지 회원 삭제
	public int memberDelete(MemberVO vo) {
		return sqlSession.delete("member.memberDelete", vo);   
	}
	
	
	// 마이페이지 내가 쓴글
	public List<Map> mypageWritten(MemberVO searchvo) {
		return sqlSession.selectList("member.mypageWritten", searchvo);
	}
	public int mypageWrittenCount(MemberVO searchvo) {
		return sqlSession.selectOne("member.mypageWrittenCount", searchvo);
	}
}
