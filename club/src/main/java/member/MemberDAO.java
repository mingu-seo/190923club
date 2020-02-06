package member;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원가입
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
	
	public int memberInsert(MemberVO vo){
		return sqlSession.insert("member.insertMember", vo);
	}
	
	
	// 유저 로그인
	public MemberVO userLogin(MemberVO vo) {
		return sqlSession.selectOne("member.userLogin", vo);
	}
	

	// 마이페이지
	public MemberVO mypageView(int num) {
		return sqlSession.selectOne("member.mypageView", num);
	}
	
	public int mypageUpdate(MemberVO vo) {
		return sqlSession.update("member.mypageUpdate", vo);
	}
	
	
	// 회원 리스트
	public List<MemberVO> MemberList(MemberVO vo){  
		return sqlSession.selectList("member.memberList", vo);
	}
	
	
	// 페이징 처리
	public int count() {
		return sqlSession.selectOne("member.count");
	}
}
