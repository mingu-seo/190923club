package interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.HandlerInterceptor;

import joinSpot.JoinSpotDAO;
import member.MemberVO;

public class spotMemberInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//		System.out.println("인터셉터");
		// 관리자 로그인이 안되어 있으면 튕겨내야됨
		// 관리자 로그인 여부 확인하는 방법(세션)
		if (request.getSession().getAttribute("sess") == null) { // 관리자가 로그인되어있지 않다면
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원만 접속가능합니다.');");   
			out.print("location.href='/member/loginFormBefore.do';");
			out.print("</script>");
			out.flush();
			return false; // 요청매핑처리 중단
		} else {
			MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");
			int member_num = uv.getNum();
			int spot_num = request.getParameter("spot_num") == null ? 0: Integer.parseInt(request.getParameter("spot_num"));
			
			// member_num, spot_num으로 joinspot테이블에서 조회
			// 있으면 true, 없으면 false
			ApplicationContext ctx = new ClassPathXmlApplicationContext("config/context-servlet.xml");
			JoinSpotDAO jsDAO = (JoinSpotDAO)ctx.getBean("joinSpotDAO");
			Map map = new HashMap();
			map.put("member_num", member_num);
			map.put("spot_num", spot_num);
			int r = jsDAO.checkJoinSpot(map);
			System.out.println("여기는 인터셉터 : "+r);
			if (r == 0) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('SPOT회원만 접속가능합니다.');");
				out.print("history.back();");
				out.print("</script>");
				out.flush();
				return false; // 요청매핑처리 중단
			}
			
		}
		return true;
	}
}
