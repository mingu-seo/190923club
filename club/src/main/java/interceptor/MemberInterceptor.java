package interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class MemberInterceptor implements HandlerInterceptor {

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
		}
		return true;
	}
}
  