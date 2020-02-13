package joinSpot;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;

@Repository
public class JoinSpotDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// spot 가입
	public int joinSpot(JoinSpotVO jv){
		return sqlSession.insert("joinSpot.joinSpot", jv);
	}
	
	
	// spot 회원 리스트
	public List<MemberVO> spotMemberList(MemberVO vo){  
		return sqlSession.selectList("joinSpot.spotMemberList", vo);
	}
	
	public int spotMemberCount(MemberVO vo) {
		return sqlSession.selectOne("joinSpot.spotMemberCount", vo);
	}
	
	
	// spot 회원 휴면
	public int spotMemberSleep(JoinSpotVO jv) {
		return sqlSession.update("joinSpot.spotMemberSleep", jv);
	}
	
}
