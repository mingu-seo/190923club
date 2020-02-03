package spot;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spot.SpotVO;




@Controller
public class SpotController {
	@Autowired
	private SpotDAO spotDao;
		
	@Autowired
	private SpotService spotService;

	//HOT SPOT 등록 폼
	@RequestMapping("/spot/spotRegist.do")
	public String spotWrite() {
		return "spot/spotRegistForm";
	}
	
	//HOT SPOT 등록
	@RequestMapping("/spot/spotInsert.do")
	public String spotInsert(SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = spotService.spotInsert(spotvo, file,request);
		//if(r < 0)
		return "re-----------do";
	}	
	

	//HOT SPOT 상세보기
	@RequestMapping("/spot/Ajax.do")
	public String spotView(Model model,@RequestParam(name="page",required=false) String page, @RequestParam("num") int num) {
		SpotVO spotvo = spotService.spotView(num);
		model.addAttribute("list", spotvo);
		model.addAttribute("nowPage", page);
		return "spot/spotAjax";
		
	}
	
	//HOT SPOT 수정 폼
	@RequestMapping("/spot/UpdateForm.do")
	
	public String spotUpdateForm(Model model, @RequestParam("num") int num) {
		SpotVO spotvo = spotService.spotView(num);
		model.addAttribute("vo",spotvo);
		return "spot/spotUpdateForm";
	}
	//HOT SPOT 수정하기
	@RequestMapping("/spot/Update.do")
	public String spotUpdate(SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		spotService.spotUpdate(spotvo, file, request);

		return "redirect:/spot/spotList.do";
	}
	
	//HOT SPOT 삭제하기
	@RequestMapping("/spot/Delete.do")
	public String spotDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		spotService.spotDelete(num);
		return "redirect:/spot/spotList.do";
	}
	
	@RequestMapping("/spot/nameCheck.do")
	public String nameCheck(Model model, @RequestParam("name") String name) {
		int cnt = spotService.nameCheck(name);
		model.addAttribute("value", cnt);
		return "spot/include/return";
	}
	
	@RequestMapping("/spot/joinProcess.do")
	public String insert(Model model, SpotVO spotvo) {
		int r = spotService.insert(spotvo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/user//spotList.do";
		} else {
			msg = "회원가입 실패";
			url = "/spot/joinForm.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	
	


}