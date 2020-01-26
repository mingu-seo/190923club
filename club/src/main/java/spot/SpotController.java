package spot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spotCategory.SpotCategoryVO;



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
	public String spotInsert(SpotVO vo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = spotService.spotInsert(vo, file,request);
		//if(r < 0)
		return "re-----------do";
	}	
	

	
	@RequestMapping("/spot/nameCheck.do")
	public String nameCheck(Model model, @RequestParam("name") String name) {
		int cnt = spotService.nameCheck(name);
		model.addAttribute("value", cnt);
		return "include/return";
	}
	
	@RequestMapping("/spot/joinProcess.do")
	public String insert(Model model, SpotVO vo) {
		int r = spotService.insert(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/user/category/spotList.do";
		} else {
			msg = "회원가입 실패";
			url = "/spot/joinForm.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	
	


}
