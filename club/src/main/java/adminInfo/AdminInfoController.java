package adminInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spot.SpotService;
import spot.SpotVO;



@Controller
public class AdminInfoController {
	@Autowired
	private AdminInfoDAO adminInfoDao;
	
	@Autowired
	private AdminInfoService adminInfoService;
	
	@Autowired
	private SpotService spotService;
	
	//카테고리 등록 폼
	@RequestMapping("/admin/info/infoRegistForm.do")
	public String adminInfoWirte() {
		return "admin/info/infoWriteForm";
	}
	
	//카테고리 등록
	@RequestMapping("/admin/info/infoRegist.do")
	public String adminInfoInsert(AdminInfoVO infovo,@RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		adminInfoService.adminInfoInsert(infovo,file,request);
		return "redirect:/admin/info/infoList.do";
	}
	//카테고리 리스트 보기
	@RequestMapping("/admin/info/infoList.do")
	public String adminInfoList(Model model, AdminInfoVO infovo) {
		List<AdminInfoVO> list = adminInfoService.adminInfoList(infovo);
		model.addAttribute("info_article",list);
		model.addAttribute("infovo",infovo);
		return "admin/info/infoList";
	}

	//카테고리 상세보기
	@RequestMapping("/admin/info/infoAjax.do")
	public String adminInfoView(Model model,@RequestParam(name="page",required=false) String page, @RequestParam("num") int num) {
		AdminInfoVO infovo = adminInfoService.adminInfoView(num);
		model.addAttribute("infovo", infovo);
		model.addAttribute("nowPage", page);
		return "admin/info/infoAjax";
		
	}
	
	//카테고리 수정 폼
	@RequestMapping("/admin/info/infoUpdateForm.do")
	
	public String adminInfoForm(Model model, @RequestParam("num") int num) {
		AdminInfoVO infovo = adminInfoService.adminInfoView(num);
		model.addAttribute("infovo",infovo);
		return "admin/info/infoUpdateForm";
	}
	//카테고리 수정하기
	@RequestMapping("/admin/info/infoUpdate.do")
	public String adminInfoUpdate(AdminInfoVO infovo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		adminInfoService.adminInfoUpdate(infovo, file, request);

		return "redirect:/admin/info/infoList.do";
	}
	
	//카테고리 삭제하기
	@RequestMapping("/admin/info/infoDelete.do")
	public String adminInfoDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		adminInfoService.adminInfoDelete(num);
		return "redirect:/admin/info/infoList.do";
	}
	
}
