package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import member.MemberVO;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO vo = new MemberVO();
		vo.setId("세영이");
		vo.setName("김세영");
		vo.setNum(34);
		request.getSession().setAttribute("sess", vo);
		return true;
	}
}
